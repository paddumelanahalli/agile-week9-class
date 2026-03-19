#features/user_auth.feature
Feature: Bulk User Creation
  Scenario: Uploading a batch of students to UCSC portal
    Given the following new student records:
      | name    | email           | id    |
      | Alice   | alice@ucsc.edu  | 101   |
      | Bob     | bob@ucsc.edu    | 102   |
      | Charlie | charlie@me.com  | 103   |
    When I filter for 'ucsc.edu' emails
    Then I should have 2 valid students in the system


#features/steps/user_steps.py
from behave import given, when, then

@given('the following new student records')
def step_impl(context):
    # context.table is a built-in Behave object created from the Gherkin table
    context.raw_data = []
    for row in context.table:
        context.raw_data.append({
            "name": row['name'],
            "email": row['email'],
            "id": int(row['id'])
        })

@when("I filter for '{domain}' emails")
def step_impl(context, domain):
    context.filtered = [u for u in context.raw_data if u['email'].endswith(domain)]

@then('I should have {count:d} valid students in the system')
def step_impl(context, count):
    assert len(context.filtered) == count
