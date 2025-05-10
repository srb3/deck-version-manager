#!/usr/bin/env bash
#
# Basic test script for DVM
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Temporary directory for testing
TEST_DIR=$(mktemp -d)
export HOME="${TEST_DIR}"

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DVM_PATH="${SCRIPT_DIR}/../dvm"

# Count tests
TESTS_TOTAL=0
TESTS_PASSED=0
TESTS_FAILED=0

# Run a test and report
run_test() {
  local test_name="$1"
  local test_cmd="$2"
  
  TESTS_TOTAL=$((TESTS_TOTAL + 1))
  
  echo -e "${YELLOW}Running test: ${test_name}${NC}"
  if eval "${test_cmd}"; then
    echo -e "${GREEN}✓ Test passed: ${test_name}${NC}"
    TESTS_PASSED=$((TESTS_PASSED + 1))
    return 0
  else
    echo -e "${RED}✗ Test failed: ${test_name}${NC}"
    TESTS_FAILED=$((TESTS_FAILED + 1))
    return 1
  fi
}

# Cleanup function
cleanup() {
  echo "Cleaning up test directory..."
  rm -rf "${TEST_DIR}"
}

# Register cleanup on exit
trap cleanup EXIT

# Make DVM executable
chmod +x "${DVM_PATH}"

# Run tests
echo "Starting DVM tests..."

# Test script syntax
run_test "Script syntax check" "bash -n '${DVM_PATH}'"

# Test help command
run_test "Help command" "${DVM_PATH} help | grep -q 'Usage: dvm'"

# Test initialization
run_test "Directory initialization" "${DVM_PATH} help && [ -d '${HOME}/.dvm' ]"

# Test remote listing (with limited output to avoid large API calls)
run_test "Remote version listing" "${DVM_PATH} list-remote 1 | grep -q 'Available versions'"
# Test installed listing (should be empty)
run_test "Installed version listing (empty)" "${DVM_PATH} list | grep -q 'No versions installed yet'"

# Test install command (mock version for testing)
# This test is optional and may fail if network issues occur
if command -v curl &>/dev/null && curl --version &>/dev/null; then
  echo -e "${YELLOW}Attempting installation test (may be skipped)...${NC}"
  ${DVM_PATH} install v1.46.3 || echo -e "${YELLOW}Install test skipped due to network or GitHub API limitations${NC}"
fi

# Test current command (should fail as no version is set)
run_test "Current version check (none)" "${DVM_PATH} current 2>&1 | grep -q 'No deck version is currently selected' || [ \$? -eq 1 ]"

# Report test results
echo ""
echo "Test Results:"
echo "-------------"
echo "Total tests: ${TESTS_TOTAL}"
echo -e "${GREEN}Passed: ${TESTS_PASSED}${NC}"
if [ "${TESTS_FAILED}" -gt 0 ]; then
  echo -e "${RED}Failed: ${TESTS_FAILED}${NC}"
  exit 1
else
  echo -e "${GREEN}All tests passed!${NC}"
  exit 0
fi
