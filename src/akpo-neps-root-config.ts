import { registerApplication, start, LifeCycles } from "single-spa";

//registerApplication({
//  name: "@single-spa/welcome",
//  app: () =>
//    System.import<LifeCycles>(
//      "https://unpkg.com/single-spa-welcome/dist/single-spa-welcome.js"
//    ),
//  activeWhen: ["/"],
//});

registerApplication({
   name: "@akpo-neps/mf-login",
  app: () => System.import<LifeCycles>("@akpo-neps/mf-login"),
   activeWhen: ["/"]
});

start({
  urlRerouteOnly: true,
});
