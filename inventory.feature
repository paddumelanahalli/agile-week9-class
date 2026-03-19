#features/inventory.feature
Feature: Cisco Router Inventory Management
  As a Lab Manager
  I want to track hardware stock
  So that I can maintain 100% uptime

  Scenario Outline: Validating stock calculations
    Given the warehouse starts with <initial> units
    When I remove <taken> units
    Then the remaining count should be <final>

    Examples: Hardware Counts
      | initial | taken | final |
      | 100     | 20    | 80    |
      | 50      | 50    | 0     |
      | 10      | 15    | -5    |
      | 0       | 0     | 0     |


#/features/steps/inventory_steps.py
from behave import given, when, then

@given('the warehouse starts with {initial:d} units')
def step_impl(context, initial):
    context.stock = initial

@when('I remove {taken:d} units')
def step_impl(context, taken):
    context.stock -= taken

@then('the remaining count should be {final:d}')
def step_impl(context, final):
    assert context.stock == final, f"Expected {final} but got {context.stock}"
