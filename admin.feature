#features/admin.feature
@security
#Case Sensitivity: @Security is not the same as @security.
Feature: Admin Access
  Scenario: Verify Admin Initialization
    Given the system is initialized for admin
    Then I should see the admin dashboard


# features/steps/common_steps.py
from behave import given, then

@given('the system is initialized for {user_role}')
def step_impl(context, user_role):
    context.user_role = user_role
    print(f"DEBUG: Initializing system for {user_role}")

@then('I should see the admin dashboard')
def step_impl(context):
    assert context.user_role == "admin"
