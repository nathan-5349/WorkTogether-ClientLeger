# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: auth.spec.ts >> Connexion utilisateur >> Des identifiants incorrects affichent un message d'erreur
- Location: tests\e2e\auth.spec.ts:44:3

# Error details

```
Test timeout of 30000ms exceeded.
```

```
Error: locator.fill: Test timeout of 30000ms exceeded.
Call log:
  - waiting for locator('input[name="_username"]')

```

# Page snapshot

```yaml
- generic [active] [ref=e1]:
  - banner [ref=e2]:
    - generic [ref=e3]:
      - heading "Symfony Exception" [level=1] [ref=e4]:
        - img [ref=e5]
        - text: Symfony Exception
      - link "Symfony Docs" [ref=e8] [cursor=pointer]:
        - /url: https://symfony.com/doc/7.4.0/index.html
        - img [ref=e10]
        - text: Symfony Docs
  - generic [ref=e12]:
    - generic [ref=e14]:
      - heading "ResourceNotFoundException NotFoundHttpException" [level=2] [ref=e15]:
        - link "ResourceNotFoundException" [ref=e16] [cursor=pointer]:
          - /url: "#trace-box-2"
        - img [ref=e18]
        - link "NotFoundHttpException" [ref=e20] [cursor=pointer]:
          - /url: "#trace-box-1"
      - heading "HTTP 404 Not Found" [level=2] [ref=e21]
    - generic [ref=e23]:
      - heading "No route found for \"GET http://127.0.0.1:8000/login\"" [level=1] [ref=e24]
      - img [ref=e26]
  - generic [ref=e29]:
    - tablist [ref=e30]:
      - tab "Exceptions 2" [selected] [ref=e31] [cursor=pointer]:
        - text: Exceptions
        - generic [ref=e32]: "2"
      - tab "Logs 1" [ref=e33] [cursor=pointer]:
        - text: Logs
        - generic [ref=e34]: "1"
      - tab "Stack Traces 2" [ref=e35] [cursor=pointer]:
        - text: Stack Traces
        - generic [ref=e36]: "2"
    - tabpanel [ref=e37]:
      - generic [ref=e38]:
        - generic [ref=e40]:
          - generic [ref=e41]:
            - generic [ref=e42] [cursor=pointer]:
              - img [ref=e44]
              - heading "Symfony\\Component\\HttpKernel\\Exception\\ NotFoundHttpException" [level=3] [ref=e46]:
                - generic [ref=e47]: Symfony\Component\HttpKernel\Exception\
                - text: NotFoundHttpException
            - group [ref=e48]:
              - generic "Show exception properties" [ref=e49] [cursor=pointer]
          - generic [ref=e50]:
            - generic [ref=e51]:
              - generic [ref=e52] [cursor=pointer]:
                - img [ref=e54]
                - generic [ref=e56]:
                  - text: in
                  - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\EventListener\\RouterListener.php" [ref=e57]:
                    - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\EventListener\RouterListener.php#L156
                    - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\EventListener\
                    - strong [ref=e58]: RouterListener.php
                  - text: (line 156)
              - list [ref=e60]:
                - listitem [ref=e61]:
                  - code
                - listitem [ref=e62]:
                  - code [ref=e63]: "if ($referer = $request->headers->get('referer')) {"
                - listitem [ref=e64]:
                  - code [ref=e65]: $message .= \sprintf(' (from "%s")', $referer);
                - listitem [ref=e66]:
                  - code [ref=e67]: "}"
                - listitem [ref=e68]:
                  - code
                - listitem [ref=e69]:
                  - code [ref=e70]: throw new NotFoundHttpException($message, $e);
                - listitem [ref=e71]:
                  - code [ref=e72]: "} catch (MethodNotAllowedException $e) {"
                - listitem [ref=e73]:
                  - code [ref=e74]: "$message = \\sprintf('No route found for \"%s %s\": Method Not Allowed (Allow: %s)', $request->getMethod(), $request->getUriForPath($request->getPathInfo()), implode(', ', $e->getAllowedMethods()));"
                - listitem [ref=e75]:
                  - code
                - listitem [ref=e76]:
                  - code [ref=e77]: throw new MethodNotAllowedHttpException($e->getAllowedMethods(), $message, $e);
                - listitem [ref=e78]:
                  - code [ref=e79]: "}"
            - generic [ref=e81] [cursor=pointer]:
              - img [ref=e83]
              - generic [ref=e85]: RouterListener
              - text: "->onKernelRequest"
              - generic [ref=e86]:
                - text: (
                - emphasis [ref=e87]: object
                - text: (RequestEvent), 'kernel.request',
                - emphasis [ref=e88]: object
                - text: (TraceableEventDispatcher))
              - generic [ref=e89]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\event-dispatcher\\Debug\\WrappedListener.php" [ref=e90]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\event-dispatcher\Debug\WrappedListener.php#L115
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\event-dispatcher\Debug\
                  - strong [ref=e91]: WrappedListener.php
                - text: (line 115)
            - generic [ref=e93] [cursor=pointer]:
              - img [ref=e95]
              - generic [ref=e97]: WrappedListener
              - text: "->__invoke"
              - generic [ref=e98]:
                - text: (
                - emphasis [ref=e99]: object
                - text: (RequestEvent), 'kernel.request',
                - emphasis [ref=e100]: object
                - text: (TraceableEventDispatcher))
              - generic [ref=e101]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\event-dispatcher\\EventDispatcher.php" [ref=e102]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\event-dispatcher\EventDispatcher.php#L206
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\event-dispatcher\
                  - strong [ref=e103]: EventDispatcher.php
                - text: (line 206)
            - generic [ref=e105] [cursor=pointer]:
              - img [ref=e107]
              - generic [ref=e109]: EventDispatcher
              - text: "->callListeners"
              - generic [ref=e110]:
                - text: (
                - emphasis [ref=e111]: array
                - text: (
                - emphasis [ref=e112]: object
                - text: (WrappedListener),
                - emphasis [ref=e113]: object
                - text: (WrappedListener),
                - emphasis [ref=e114]: object
                - text: (WrappedListener),
                - emphasis [ref=e115]: object
                - text: (WrappedListener),
                - emphasis [ref=e116]: object
                - text: (WrappedListener),
                - emphasis [ref=e117]: object
                - text: (WrappedListener),
                - emphasis [ref=e118]: object
                - text: (WrappedListener),
                - emphasis [ref=e119]: object
                - text: (WrappedListener),
                - emphasis [ref=e120]: object
                - text: (WrappedListener),
                - emphasis [ref=e121]: object
                - text: (WrappedListener),
                - emphasis [ref=e122]: object
                - text: (WrappedListener),
                - emphasis [ref=e123]: object
                - text: (WrappedListener)), 'kernel.request',
                - emphasis [ref=e124]: object
                - text: (RequestEvent))
              - generic [ref=e125]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\event-dispatcher\\EventDispatcher.php" [ref=e126]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\event-dispatcher\EventDispatcher.php#L56
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\event-dispatcher\
                  - strong [ref=e127]: EventDispatcher.php
                - text: (line 56)
            - generic [ref=e129] [cursor=pointer]:
              - img [ref=e131]
              - generic [ref=e133]: EventDispatcher
              - text: "->dispatch"
              - generic [ref=e134]:
                - text: (
                - emphasis [ref=e135]: object
                - text: (RequestEvent), 'kernel.request')
              - generic [ref=e136]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\event-dispatcher\\Debug\\TraceableEventDispatcher.php" [ref=e137]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\event-dispatcher\Debug\TraceableEventDispatcher.php#L126
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\event-dispatcher\Debug\
                  - strong [ref=e138]: TraceableEventDispatcher.php
                - text: (line 126)
            - generic [ref=e140] [cursor=pointer]:
              - img [ref=e142]
              - generic [ref=e144]: TraceableEventDispatcher
              - text: "->dispatch"
              - generic [ref=e145]:
                - text: (
                - emphasis [ref=e146]: object
                - text: (RequestEvent), 'kernel.request')
              - generic [ref=e147]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\HttpKernel.php" [ref=e148]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\HttpKernel.php#L159
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\
                  - strong [ref=e149]: HttpKernel.php
                - text: (line 159)
            - generic [ref=e151] [cursor=pointer]:
              - img [ref=e153]
              - generic [ref=e155]: HttpKernel
              - text: "->handleRaw"
              - generic [ref=e156]:
                - text: (
                - emphasis [ref=e157]: object
                - text: (Request), 1)
              - generic [ref=e158]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\HttpKernel.php" [ref=e159]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\HttpKernel.php#L76
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\
                  - strong [ref=e160]: HttpKernel.php
                - text: (line 76)
            - generic [ref=e162] [cursor=pointer]:
              - img [ref=e164]
              - generic [ref=e166]: HttpKernel
              - text: "->handle"
              - generic [ref=e167]:
                - text: (
                - emphasis [ref=e168]: object
                - text: (Request), 1,
                - emphasis [ref=e169]: "true"
                - text: )
              - generic [ref=e170]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\Kernel.php" [ref=e171]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\Kernel.php#L182
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\
                  - strong [ref=e172]: Kernel.php
                - text: (line 182)
            - generic [ref=e174] [cursor=pointer]:
              - img [ref=e176]
              - generic [ref=e178]: Kernel
              - text: "->handle"
              - generic [ref=e179]:
                - text: (
                - emphasis [ref=e180]: object
                - text: (Request))
              - generic [ref=e181]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\runtime\\Runner\\Symfony\\HttpKernelRunner.php" [ref=e182]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\runtime\Runner\Symfony\HttpKernelRunner.php#L35
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\runtime\Runner\Symfony\
                  - strong [ref=e183]: HttpKernelRunner.php
                - text: (line 35)
            - generic [ref=e185] [cursor=pointer]:
              - img [ref=e187]
              - generic [ref=e189]: HttpKernelRunner
              - text: "->run()"
              - generic [ref=e190]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\autoload_runtime.php" [ref=e191]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\autoload_runtime.php#L32
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\
                  - strong [ref=e192]: autoload_runtime.php
                - text: (line 32)
            - generic [ref=e194] [cursor=pointer]:
              - img [ref=e196]
              - text: require_once('C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\autoload_runtime.php')
              - generic [ref=e198]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\public\\index.php" [ref=e199]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\public\index.php#L5
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\public\
                  - strong [ref=e200]: index.php
                - text: (line 5)
        - generic [ref=e204] [cursor=pointer]:
          - img [ref=e206]
          - heading "Symfony\\Component\\Routing\\Exception\\ ResourceNotFoundException" [level=3] [ref=e208]:
            - generic [ref=e209]: Symfony\Component\Routing\Exception\
            - text: ResourceNotFoundException
          - paragraph [ref=e210]: No routes found for "/login/".
    - text: ✔ ▾
  - region "Symfony Web Debug Toolbar" [ref=e211]:
    - generic [ref=e214]:
      - link "404" [ref=e216] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/37b653?panel=request
        - generic [ref=e218]: "404"
      - link [ref=e220] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/37b653?panel=api_platform.data_collector.request
        - img [ref=e222]
      - link "97 ms" [ref=e247] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/37b653?panel=time
        - generic [ref=e248]:
          - generic [ref=e249]: "97"
          - generic [ref=e250]: ms
      - link "6.0 MiB" [ref=e252] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/37b653?panel=time
        - generic [ref=e253]:
          - generic [ref=e254]: "6.0"
          - generic [ref=e255]: MiB
      - link "Logger 1" [ref=e257] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/37b653?panel=logger
        - generic [ref=e258]:
          - img "Logger" [ref=e259]
          - generic [ref=e263]: "1"
      - link "Security n/a" [ref=e265] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/37b653?panel=security
        - generic [ref=e266]:
          - img "Security" [ref=e267]
          - generic [ref=e271]: n/a
      - link "Twig 1 ms" [ref=e273] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/37b653?panel=twig
        - generic [ref=e274]:
          - img "Twig" [ref=e275]
          - generic [ref=e279]: "1"
          - generic [ref=e280]: ms
      - link "Symfony 7.4.0" [ref=e282] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/37b653?panel=config
        - generic [ref=e283]:
          - img "Symfony" [ref=e285]
          - generic [ref=e287]: 7.4.0
      - generic [ref=e289]:
        - img [ref=e291]
        - generic [ref=e294]: Server
      - button [expanded] [ref=e295] [cursor=pointer]:
        - generic "Close Toolbar" [ref=e296]:
          - img [ref=e297]
```

# Test source

```ts
  1  | import { test, expect } from '@playwright/test';
  2  | import { login, USERS } from './auth-helper';
  3  | /**
  4  |  * Tests de connexion basés sur les fixtures AppFixtures.php.
  5  |  *
  6  |  * Le DashboardController redirige selon le rôle :
  7  |  *   ROLE_ADMIN        → /fr/admin/dashboard
  8  |  *   ROLE_ACCOUNTANT   → /fr/accountant/dashboard
  9  |  *   ROLE_SUPPORT      → /fr/support/dashboard
  10 |  *   ROLE_TECHNICIAN   → /fr/technician/dashboard
  11 |  *   ROLE_CUSTOMER     → /fr/customer/dashboard
  12 |  */
  13 | test.describe('Connexion utilisateur', () => {
  14 |   test('Un client particulier peut se connecter et arrive sur son dashboard', async ({ page }) => {
  15 |     await login(page, USERS.particular.email, USERS.particular.password);
  16 | 
  17 |     // DashboardController → app_customer_dashboard
  18 |     await expect(page).toHaveURL(/\/customer\/dashboard/);
  19 | 
  20 |     // Le dashboard affiche le prénom de l'utilisateur (Jean, depuis les fixtures)
  21 |     await expect(page.locator('.dash-name')).toContainText(/Jean/);
  22 |   });
  23 | 
  24 |   test('Un client entreprise peut se connecter', async ({ page }) => {
  25 |     await login(page, USERS.company.email, USERS.company.password);
  26 | 
  27 |     await expect(page).toHaveURL(/\/customer\/dashboard/);
  28 |     // Marc Leroy — company@test.fr
  29 |     await expect(page.locator('.dash-name')).toContainText(/Marc/);
  30 |   });
  31 | 
  32 |   test("L'admin peut se connecter et arrive sur le dashboard admin", async ({ page }) => {
  33 |     await login(page, USERS.admin.email, USERS.admin.password);
  34 | 
  35 |     await expect(page).toHaveURL(/\/admin\/dashboard/);
  36 |   });
  37 | 
  38 |   test('Un technicien peut se connecter', async ({ page }) => {
  39 |     await login(page, USERS.technician.email, USERS.technician.password);
  40 | 
  41 |     await expect(page).toHaveURL(/\/technician\/dashboard/);
  42 |   });
  43 | 
  44 |   test('Des identifiants incorrects affichent un message d\'erreur', async ({ page }) => {
  45 |     await page.goto('/login');
  46 | 
> 47 |     await page.locator('input[name="_username"]').fill('inconnu@test.fr');
     |                                                   ^ Error: locator.fill: Test timeout of 30000ms exceeded.
  48 |     await page.locator('input[name="_password"]').fill('mauvais_mdp');
  49 |     await page.getByRole('button', { name: /se connecter/i }).click();
  50 | 
  51 |     // Reste sur /login
  52 |     await expect(page).toHaveURL(/\/login/);
  53 | 
  54 |     // Le template login.html.twig affiche error.messageKey via security.fr.yaml
  55 |     // → "Identifiants invalides."
  56 |     await expect(page.locator('.alert-danger, [class*="alert"]')).toBeVisible();
  57 |   });
  58 | 
  59 |   test('Un utilisateur peut se déconnecter', async ({ page }) => {
  60 |     await login(page, USERS.particular.email, USERS.particular.password);
  61 |     await expect(page).toHaveURL(/\/customer\/dashboard/);
  62 | 
  63 |     // Lien de déconnexion dans la navbar (base.html.twig)
  64 |     await page.getByRole('link', { name: /déconnexion/i }).click();
  65 | 
  66 |     // Après logout, retour sur la page d'accueil ou /login
  67 |     await expect(page).toHaveURL(/\/(fr\/?)?$/);
  68 |   });
  69 | });
```