# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: protected-pages.spec.ts >> Accès aux pages protégées sans authentification >> "édition profil" redirige vers /login
- Location: tests\e2e\protected-pages.spec.ts:22:5

# Error details

```
Error: expect(page).toHaveURL(expected) failed

Expected pattern: /\/login/
Received string:  "http://127.0.0.1:8000/fr/customer/edit"
Timeout: 5000ms

Call log:
  - Expect "toHaveURL" with timeout 5000ms
    9 × unexpected value "http://127.0.0.1:8000/fr/customer/edit"

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
      - heading "Error" [level=2] [ref=e15]:
        - link "Error" [ref=e16] [cursor=pointer]:
          - /url: "#trace-box-1"
      - heading "HTTP 500 Internal Server Error" [level=2] [ref=e17]
    - generic [ref=e19]:
      - heading "Call to a member function isParticular() on null" [level=1] [ref=e20]
      - img [ref=e22]
  - generic [ref=e25]:
    - tablist [ref=e26]:
      - tab "Exception" [selected] [ref=e27] [cursor=pointer]
      - tab "Logs 1" [ref=e28] [cursor=pointer]:
        - text: Logs
        - generic [ref=e29]: "1"
      - tab "Stack Trace" [ref=e30] [cursor=pointer]
    - tabpanel [ref=e31]:
      - generic [ref=e34]:
        - generic [ref=e36] [cursor=pointer]:
          - img [ref=e38]
          - heading "Error" [level=3] [ref=e40]
        - generic [ref=e41]:
          - generic [ref=e42]:
            - generic [ref=e43] [cursor=pointer]:
              - img [ref=e45]
              - generic [ref=e47]:
                - text: in
                - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\src\\Controller\\CustomerController.php" [ref=e48]:
                  - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\src\Controller\CustomerController.php#L46
                  - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\src\Controller\
                  - strong [ref=e49]: CustomerController.php
                - text: (line 46)
            - list [ref=e51]:
              - listitem [ref=e52]:
                - code [ref=e53]: "#[Route('/customer/edit', name: 'app_customer_edit')]"
              - listitem [ref=e54]:
                - code [ref=e55]: "public function edit(Request $request, EntityManagerInterface $em): Response"
              - listitem [ref=e56]:
                - code [ref=e57]: "{"
              - listitem [ref=e58]:
                - code [ref=e59]: $user = $this->getUser();
              - listitem [ref=e60]:
                - code
              - listitem [ref=e61]:
                - code [ref=e62]: "if ($user->isParticular()) {"
              - listitem [ref=e63]:
                - code [ref=e64]: $form = $this->createForm(ParticularRegistrationType::class, $user, ['is_edit' => true]);
              - listitem [ref=e65]:
                - code [ref=e66]: "} else {"
              - listitem [ref=e67]:
                - code [ref=e68]: $form = $this->createForm(CompanyRegistrationType::class, $user, ['is_edit' => true]);
              - listitem [ref=e69]:
                - code [ref=e70]: "}"
              - listitem [ref=e71]:
                - code
          - generic [ref=e73] [cursor=pointer]:
            - img [ref=e75]
            - generic [ref=e77]: CustomerController
            - text: "->edit"
            - generic [ref=e78]:
              - text: (
              - emphasis [ref=e79]: object
              - text: (Request),
              - emphasis [ref=e80]: object
              - text: (EntityManager))
            - generic [ref=e81]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\HttpKernel.php" [ref=e82]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\HttpKernel.php#L183
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\
                - strong [ref=e83]: HttpKernel.php
              - text: (line 183)
          - generic [ref=e85] [cursor=pointer]:
            - img [ref=e87]
            - generic [ref=e89]: HttpKernel
            - text: "->handleRaw"
            - generic [ref=e90]:
              - text: (
              - emphasis [ref=e91]: object
              - text: (Request), 1)
            - generic [ref=e92]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\HttpKernel.php" [ref=e93]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\HttpKernel.php#L76
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\
                - strong [ref=e94]: HttpKernel.php
              - text: (line 76)
          - generic [ref=e96] [cursor=pointer]:
            - img [ref=e98]
            - generic [ref=e100]: HttpKernel
            - text: "->handle"
            - generic [ref=e101]:
              - text: (
              - emphasis [ref=e102]: object
              - text: (Request), 1,
              - emphasis [ref=e103]: "true"
              - text: )
            - generic [ref=e104]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\Kernel.php" [ref=e105]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\Kernel.php#L182
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\
                - strong [ref=e106]: Kernel.php
              - text: (line 182)
          - generic [ref=e108] [cursor=pointer]:
            - img [ref=e110]
            - generic [ref=e112]: Kernel
            - text: "->handle"
            - generic [ref=e113]:
              - text: (
              - emphasis [ref=e114]: object
              - text: (Request))
            - generic [ref=e115]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\runtime\\Runner\\Symfony\\HttpKernelRunner.php" [ref=e116]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\runtime\Runner\Symfony\HttpKernelRunner.php#L35
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\runtime\Runner\Symfony\
                - strong [ref=e117]: HttpKernelRunner.php
              - text: (line 35)
          - generic [ref=e119] [cursor=pointer]:
            - img [ref=e121]
            - generic [ref=e123]: HttpKernelRunner
            - text: "->run()"
            - generic [ref=e124]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\autoload_runtime.php" [ref=e125]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\autoload_runtime.php#L32
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\
                - strong [ref=e126]: autoload_runtime.php
              - text: (line 32)
          - generic [ref=e128] [cursor=pointer]:
            - img [ref=e130]
            - text: require_once('C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\autoload_runtime.php')
            - generic [ref=e132]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\public\\index.php" [ref=e133]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\public\index.php#L5
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\public\
                - strong [ref=e134]: index.php
              - text: (line 5)
    - text: ✔ ▾
  - region "Symfony Web Debug Toolbar" [ref=e135]:
    - generic [ref=e138]:
      - link "500 @ app_customer_edit" [ref=e140] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/74fb3b?panel=request
        - generic [ref=e141]:
          - generic [ref=e142]: "500"
          - img [ref=e144]
          - generic [ref=e148]: "@"
          - generic [ref=e149]: app_customer_edit
      - link [ref=e151] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/74fb3b?panel=api_platform.data_collector.request
        - img [ref=e153]
      - link "65 ms" [ref=e178] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/74fb3b?panel=time
        - generic [ref=e179]:
          - generic [ref=e180]: "65"
          - generic [ref=e181]: ms
      - link "6.0 MiB" [ref=e183] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/74fb3b?panel=time
        - generic [ref=e184]:
          - generic [ref=e185]: "6.0"
          - generic [ref=e186]: MiB
      - link "Logger 1" [ref=e188] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/74fb3b?panel=logger
        - generic [ref=e189]:
          - img "Logger" [ref=e190]
          - generic [ref=e194]: "1"
      - link "Security n/a" [ref=e196] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/74fb3b?panel=security
        - generic [ref=e197]:
          - img "Security" [ref=e198]
          - generic [ref=e202]: n/a
      - link "Twig 1 ms" [ref=e204] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/74fb3b?panel=twig
        - generic [ref=e205]:
          - img "Twig" [ref=e206]
          - generic [ref=e210]: "1"
          - generic [ref=e211]: ms
      - link "Symfony 7.4.0" [ref=e213] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/74fb3b?panel=config
        - generic [ref=e214]:
          - img "Symfony" [ref=e216]
          - generic [ref=e218]: 7.4.0
      - generic [ref=e220]:
        - img [ref=e222]
        - generic [ref=e225]: Server
      - button [expanded] [ref=e226] [cursor=pointer]:
        - generic "Close Toolbar" [ref=e227]:
          - img [ref=e228]
```

# Test source

```ts
  1  | import { test, expect } from '@playwright/test';
  2  |  
  3  | /**
  4  |  * Test : une page protégée redirige vers /login
  5  |  *
  6  |  * Routes protégées selon security.yaml :
  7  |  *   - /fr/dashboard  → ROLE_USER
  8  |  *   - /fr/customer/* → ROLE_CUSTOMER
  9  |  *   - /fr/admin/*    → ROLE_ADMIN
  10 |  *   - /fr/order/*    → ROLE_CUSTOMER
  11 |  */
  12 | test.describe('Accès aux pages protégées sans authentification', () => {
  13 |   const protectedRoutes = [
  14 |     { path: '/fr/dashboard',        label: 'dashboard'         },
  15 |     { path: '/fr/customer/profile', label: 'profil client'     },
  16 |     { path: '/fr/customer/edit',    label: 'édition profil'    },
  17 |     { path: '/fr/admin/dashboard',  label: 'dashboard admin'   },
  18 |     { path: '/fr/order/reservations', label: 'réservations'   },
  19 |   ];
  20 |  
  21 |   for (const route of protectedRoutes) {
  22 |     test(`"${route.label}" redirige vers /login`, async ({ page }) => {
  23 |       await page.goto(route.path);
  24 |  
  25 |       // Symfony redirige vers /login (sans préfixe locale pour cette route)
> 26 |       await expect(page).toHaveURL(/\/login/);
     |                          ^ Error: expect(page).toHaveURL(expected) failed
  27 |  
  28 |       // Vérifie que la page de connexion s'affiche bien
  29 |       await expect(page.locator('input[name="_username"]')).toBeVisible();
  30 |       await expect(page.locator('input[name="_password"]')).toBeVisible();
  31 |     });
  32 |   }
  33 |  
  34 |   test('La route /fr/offers est accessible publiquement', async ({ page }) => {
  35 |     // Selon security.yaml : path: ^/offer → PUBLIC_ACCESS
  36 |     await page.goto('/fr/offers');
  37 |     await expect(page).not.toHaveURL(/\/login/);
  38 |     // Le titre de la page offres est présent (messages_fr.yaml : offers.title)
  39 |     await expect(page.locator('h1')).toContainText(/offre/i);
  40 |   });
  41 |  
  42 |   test("La page d'accueil est accessible publiquement", async ({ page }) => {
  43 |     // path: ^/$ → PUBLIC_ACCESS
  44 |     await page.goto('/');
  45 |     await expect(page).not.toHaveURL(/\/login/);
  46 |   });
  47 | });
```