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
