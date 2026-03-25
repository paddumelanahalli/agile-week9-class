#/features/steps/steps.py
from behave import given, when, then

# Shared state
@given('the system is running')
def step_system_running(context):
    context.system = "RUNNING"

# SECURITY
@when('user tries valid credentials')
def step_valid_login(context):
    context.login = "SUCCESS"

@when('system runs deep security scan')
def step_security_scan(context):
    context.scan = "PASSED"

@then('access should be granted')
def step_access(context):
    assert context.login == "SUCCESS"

@then('audit should pass')
def step_audit(context):
    assert context.scan == "PASSED"

# SMOKE
@then('system should be healthy')
def step_health(context):
    assert context.system == "RUNNING"

# SLOW
@when('heavy load is applied')
def step_load(context):
    context.load = "HEAVY"

@then('system should remain stable')
def step_stable(context):
    assert context.load == "HEAVY"

#security.feature
  @security
  Scenario: Valid login check
    Given the system is running
    When user tries valid credentials
    Then access should be granted

  @security @slow
  Scenario: Heavy security audit
    Given the system is running
    When system runs deep security scan
    Then audit should pass


#slow.feature
Feature: Slow Performance Tests

  @slow
  Scenario: Load test system
    Given the system is running
    When heavy load is applied
    Then system should remain stable

#smoke.feature
Feature: Smoke Tests

  @smoke
  Scenario: App starts successfully
    Given the system is running
    Then system should be healthy


