# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: protected-pages.spec.ts >> Accès aux pages protégées sans authentification >> "dashboard admin" redirige vers /login
- Location: tests\e2e\protected-pages.spec.ts:22:5

# Error details

```
Error: expect(page).toHaveURL(expected) failed

Expected pattern: /\/login/
Received string:  "http://127.0.0.1:8000/fr/admin/dashboard"
Timeout: 5000ms

Call log:
  - Expect "toHaveURL" with timeout 5000ms
    9 × unexpected value "http://127.0.0.1:8000/fr/admin/dashboard"

```

# Page snapshot

```yaml
- generic [active] [ref=e1]:
  - navigation [ref=e2]:
    - link "⬡ WorkTogether" [ref=e3] [cursor=pointer]:
      - /url: /fr/accueil
      - generic [ref=e4]: ⬡
      - generic [ref=e5]: WorkTogether
    - generic [ref=e6]:
      - link "Accueil" [ref=e7] [cursor=pointer]:
        - /url: /fr/accueil
      - link "Nos offres" [ref=e8] [cursor=pointer]:
        - /url: /fr/offers
      - link "Connexion" [ref=e9] [cursor=pointer]:
        - /url: /fr/login
      - link "S'inscrire" [ref=e10] [cursor=pointer]:
        - /url: /fr/registration
    - button "FR ▼" [ref=e13] [cursor=pointer]:
      - img [ref=e14]
      - text: FR
      - generic [ref=e15]: ▼
  - generic [ref=e16]:
    - heading "Hello AdminController! ✅" [level=1] [ref=e17]
    - text: "This friendly message is coming from:"
    - list [ref=e18]:
      - listitem [ref=e19]:
        - text: Your controller at
        - code [ref=e20]: C:/Users/Nathan/Documents/cours IIA/projet finale/W2T_leger/WorkTogether-ClientLeger/src/Controller/AdminController.php
      - listitem [ref=e21]:
        - text: Your template at
        - code [ref=e22]: C:/Users/Nathan/Documents/cours IIA/projet finale/W2T_leger/WorkTogether-ClientLeger/templates/admin/index.html.twig
  - region "Symfony Web Debug Toolbar" [ref=e23]:
    - generic [ref=e26]:
      - link "200 @ app_admin_dashboard" [ref=e28] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/25f6f1?panel=request
        - generic [ref=e29]:
          - generic [ref=e30]: "200"
          - generic [ref=e31]: "@"
          - generic [ref=e32]: app_admin_dashboard
      - link [ref=e34] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/25f6f1?panel=api_platform.data_collector.request
        - img [ref=e36]
      - link "63 ms" [ref=e61] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/25f6f1?panel=time
        - generic [ref=e62]:
          - generic [ref=e63]: "63"
          - generic [ref=e64]: ms
      - link "4.0 MiB" [ref=e66] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/25f6f1?panel=time
        - generic [ref=e67]:
          - generic [ref=e68]: "4.0"
          - generic [ref=e69]: MiB
      - link "Logger 8" [ref=e71] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/25f6f1?panel=logger
        - generic [ref=e72]:
          - img "Logger" [ref=e73]
          - generic [ref=e77]: "8"
      - link "4" [ref=e79] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/25f6f1?panel=translation
        - generic [ref=e80]:
          - img [ref=e81]
          - generic [ref=e86]: "4"
      - link "Security n/a" [ref=e88] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/25f6f1?panel=security
        - generic [ref=e89]:
          - img "Security" [ref=e90]
          - generic [ref=e94]: n/a
      - link "Twig 13 ms" [ref=e96] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/25f6f1?panel=twig
        - generic [ref=e97]:
          - img "Twig" [ref=e98]
          - generic [ref=e102]: "13"
          - generic [ref=e103]: ms
      - link "Symfony 7.4.0" [ref=e105] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/25f6f1?panel=config
        - generic [ref=e106]:
          - img "Symfony" [ref=e108]
          - generic [ref=e110]: 7.4.0
      - generic [ref=e112]:
        - img [ref=e114]
        - generic [ref=e117]: Server
      - button [expanded] [ref=e118] [cursor=pointer]:
        - generic "Close Toolbar" [ref=e119]:
          - img [ref=e120]
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