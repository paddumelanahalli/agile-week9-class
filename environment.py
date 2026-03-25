#features/environment.py
# This file must live inside the /features folder
def before_all(context):
    """ Runs once before any tests start """
    print("\n[GLOBAL SETUP] Initializing Cisco Lab Simulation...")
    context.lab_active = True

def before_scenario(context, scenario):
    """ Runs before every individual scenario """
    print(f"\n[SCENARIO START] Testing: {scenario.name}")
    context.database_connection = "CONNECTED"

def after_scenario(context, scenario):
    """ Runs after every scenario, useful for debugging failures """
    if scenario.status == "failed":
        print(f"!!! ALERT: {scenario.name} FAILED. Captured state: {context.database_connection}")
    context.database_connection = "DISCONNECTED"

def after_all(context):
    """ Runs once at the very end """
    print("\n[GLOBAL CLEANUP] Powering down Lab Simulation...")
    context.lab_active = False


"""

output

>behave --no-capture
USING RUNNER: behave.runner:Runner

[GLOBAL SETUP] Initializing Cisco Lab Simulation...
Feature: Basic Arithmetic # features/calculator.feature:2
  As a student
  I want to use a calculator
  So that I can sum numbers correctly
[SCENARIO START] Testing: Add two numbers

  Scenario: Add two numbers     # features/calculator.feature:7
    Given I have a calculator   # features/steps/calc_steps.py:5 0.000s
    When I enter 5 and 7        # features/steps/calc_steps.py:10 0.000s
    Then the total should be 12 # features/steps/calc_steps.py:14 0.000s

[SCENARIO START] Testing: Adding multiple pairs -- @1.1 Numbers

    Then the total should be 30                            # features/steps/calc_steps.py:14 0.000s
    Then the total should be 30                            # features/steps/calc_steps.py:14
[SCENARIO START] Testing: Adding multiple pairs -- @1.2 Numbers

    Then the total should be 0                             # features/steps/calc_steps.py:14 0.000s
    Then the total should be 0                             # features/steps/calc_steps.py:14
[SCENARIO START] Testing: Adding multiple pairs -- @1.3 Numbers

    Then the total should be 100                           # features/steps/calc_steps.py:14 0.000s
    Then the total should be 100                           # features/steps/calc_steps.py:14

[GLOBAL CLEANUP] Powering down Lab Simulation...
1 feature passed, 0 failed, 0 skipped
4 scenarios passed, 0 failed, 0 skipped
12 steps passed, 0 failed, 0 skipped
Took 0min 0.001s

"""
