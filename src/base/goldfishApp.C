#include "goldfishApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

InputParameters
goldfishApp::validParams()
{
  InputParameters params = MooseApp::validParams();

  return params;
}

goldfishApp::goldfishApp(InputParameters parameters) : MooseApp(parameters)
{
  goldfishApp::registerAll(_factory, _action_factory, _syntax);
}

goldfishApp::~goldfishApp() {}

void
goldfishApp::registerAll(Factory & f, ActionFactory & af, Syntax & syntax)
{
  ModulesApp::registerAll(f, af, syntax);
  Registry::registerObjectsTo(f, {"goldfishApp"});
  Registry::registerActionsTo(af, {"goldfishApp"});

  /* register custom execute flags, action syntax, etc. here */
}

void
goldfishApp::registerApps()
{
  registerApp(goldfishApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
extern "C" void
goldfishApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  goldfishApp::registerAll(f, af, s);
}
extern "C" void
goldfishApp__registerApps()
{
  goldfishApp::registerApps();
}
