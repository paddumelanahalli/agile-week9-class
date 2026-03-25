#calculator.py
class Calculator:
    def __init__(self):
        self.result = 0
        
    def add(self,x,y):
        self.result = x+y
        return self.result


        

#features/calculator.feature
Feature: Basic Arithmetic
  As a student
  I want to use a calculator
  So that I can sum numbers correctly

  Scenario: Add two numbers
    Given I have a calculator
    When I enter 5 and 7
    Then the total should be 12


Scenario Outline: Adding multiple pairs
    Given I have a calculator
    When I enter <val1> and <val2>
    Then the total should be <total>

    Examples: Numbers
      | val1 | val2 | total |
      | 10   | 20   | 30    |
      | 1    | -1   | 0     |
      | 50   | 50   | 100   |

#/features/steps/calc_steps.py
from behave import given, when, then
from src.calculator import Calculator

@given('I have a calculator')
def step_impl(context):
    # 'context' is a shared bucket to pass data between steps
    context.calc = Calculator()

@when('I enter {num1:d} and {num2:d}')
def step_impl(context, num1, num2):
    context.result = context.calc.add(num1, num2)

@then('the total should be {expected:d}')
def step_impl(context, expected):
    assert context.result == expected


"""

output

 behave features/calculator.feature
USING RUNNER: behave.runner:Runner
Feature: Basic Arithmetic # features/calculator.feature:2
  As a student
  I want to use a calculator
  So that I can sum numbers correctly
  Scenario: Add two numbers     # features/calculator.feature:7
    Given I have a calculator   # features/steps/calc_steps.py:5 0.000s
    When I enter 5 and 7        # features/steps/calc_steps.py:10 0.000s
    Then the total should be 12 # features/steps/calc_steps.py:14 0.000s

1 feature passed, 0 failed, 0 skipped
1 scenario passed, 0 failed, 0 skipped
3 steps passed, 0 failed, 0 skipped
Took 0min 0.000s

"""
