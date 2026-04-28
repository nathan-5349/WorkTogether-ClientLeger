# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: auth.spec.ts >> Connexion utilisateur >> Un utilisateur peut se déconnecter
- Location: tests\e2e\auth.spec.ts:59:3

# Error details

```
Error: expect(page).toHaveURL(expected) failed

Expected pattern: /\/(fr\/?)?$/
Received string:  "http://127.0.0.1:8000/en/accueil"
Timeout: 5000ms

Call log:
  - Expect "toHaveURL" with timeout 5000ms
    9 × unexpected value "http://127.0.0.1:8000/en/accueil"

```

# Page snapshot

```yaml
- generic [active] [ref=e1]:
  - navigation [ref=e2]:
    - link "⬡ WorkTogether" [ref=e3] [cursor=pointer]:
      - /url: /en/accueil
      - generic [ref=e4]: ⬡
      - generic [ref=e5]: WorkTogether
    - generic [ref=e6]:
      - link "Home" [ref=e7] [cursor=pointer]:
        - /url: /en/accueil
      - link "Our offers" [ref=e8] [cursor=pointer]:
        - /url: /en/offers
      - link "Login" [ref=e9] [cursor=pointer]:
        - /url: /en/login
      - link "Sign up" [ref=e10] [cursor=pointer]:
        - /url: /en/registration
    - button "EN ▼" [ref=e13] [cursor=pointer]:
      - img [ref=e14]
      - text: EN
      - generic [ref=e15]: ▼
  - generic [ref=e16]:
    - generic:
      - img
    - generic [ref=e17]:
      - generic [ref=e18]: Infrastructure · Datacenter · Colocation
      - heading "Your infrastructure, without compromise." [level=1] [ref=e20]:
        - text: Your infrastructure,
        - generic [ref=e21]: without compromise.
      - paragraph [ref=e22]: Host your equipment in our high-density racks — ultra-fast connectivity, full redundancy, enterprise-grade physical security.
      - generic [ref=e23]:
        - link "View offers" [ref=e24] [cursor=pointer]:
          - /url: /en/offers
          - text: View offers
          - img [ref=e25]
        - link "Create an account" [ref=e27] [cursor=pointer]:
          - /url: /en/registration
      - generic [ref=e30]: Discover
  - generic [ref=e31]:
    - generic [ref=e32]:
      - generic [ref=e33]:
        - generic [ref=e34]: "30"
        - generic [ref=e35]: Active racks
      - generic [ref=e36]:
        - generic [ref=e37]: 1 260
        - generic [ref=e38]: Available units
      - generic [ref=e39]:
        - generic [ref=e40]: 99,9%
        - generic [ref=e41]: Guaranteed uptime
    - generic [ref=e42]:
      - generic [ref=e43]: Why WorkTogether
      - heading "A platform designed for professionals" [level=2] [ref=e44]
      - paragraph [ref=e45]: From connectivity to security, every detail is mastered.
    - generic [ref=e46]:
      - generic [ref=e47]:
        - generic [ref=e48]: ⚡
        - generic [ref=e49]: Ultra-fast connectivity
        - paragraph [ref=e50]: Redundant multi-operator network access with speeds up to 100 Gbps for your critical applications.
      - generic [ref=e51]:
        - generic [ref=e52]: 🔒
        - generic [ref=e53]: Physical security
        - paragraph [ref=e54]: Biometric access control, 24/7 video surveillance, and dedicated security staff to protect your assets.
      - generic [ref=e55]:
        - generic [ref=e56]: 🔋
        - generic [ref=e57]: Power redundancy
        - paragraph [ref=e58]: N+1 power supply with UPS and generators ensuring 100% operational continuity.
      - generic [ref=e59]:
        - generic [ref=e60]: 🌡
        - generic [ref=e61]: Precision cooling
        - paragraph [ref=e62]: Precision air conditioning maintaining a temperature between 18 and 27°C in all rack aisles.
      - generic [ref=e63]:
        - generic [ref=e64]: 📊
        - generic [ref=e65]: Real-time monitoring
        - paragraph [ref=e66]: "Dedicated dashboard: consumption, temperature, network throughput — everything visible from your client area."
      - generic [ref=e67]:
        - generic [ref=e68]: 🛠
        - generic [ref=e69]: Expert support
        - paragraph [ref=e70]: Technical team available for any intervention with contractually defined and respected SLAs.
    - generic [ref=e71]:
      - heading "Ready to get started?" [level=2] [ref=e72]
      - paragraph [ref=e73]: Join the companies that trust us with their critical infrastructure.
      - generic [ref=e74]:
        - link "View offers" [ref=e75] [cursor=pointer]:
          - /url: /en/offers
        - link "Create an account" [ref=e76] [cursor=pointer]:
          - /url: /en/registration
  - region "Symfony Web Debug Toolbar" [ref=e77]:
    - generic [ref=e80]:
      - link "200 Redirect @ app_home" [ref=e82] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/9ab958?panel=request
        - generic [ref=e83]:
          - generic [ref=e84]: "200"
          - img "Redirect" [ref=e86]
          - generic [ref=e89]: "@"
          - generic [ref=e90]: app_home
      - link [ref=e92] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/9ab958?panel=api_platform.data_collector.request
        - img [ref=e94]
      - link "32 ms" [ref=e119] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/9ab958?panel=time
        - generic [ref=e120]:
          - generic [ref=e121]: "32"
          - generic [ref=e122]: ms
      - link "4.0 MiB" [ref=e124] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/9ab958?panel=time
        - generic [ref=e125]:
          - generic [ref=e126]: "4.0"
          - generic [ref=e127]: MiB
      - link "Logger 8" [ref=e129] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/9ab958?panel=logger
        - generic [ref=e130]:
          - img "Logger" [ref=e131]
          - generic [ref=e135]: "8"
      - link "31" [ref=e137] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/9ab958?panel=translation
        - generic [ref=e138]:
          - img [ref=e139]
          - generic [ref=e144]: "31"
      - link "Security n/a" [ref=e146] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/9ab958?panel=security
        - generic [ref=e147]:
          - img "Security" [ref=e148]
          - generic [ref=e152]: n/a
      - link "Twig 8 ms" [ref=e154] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/9ab958?panel=twig
        - generic [ref=e155]:
          - img "Twig" [ref=e156]
          - generic [ref=e160]: "8"
          - generic [ref=e161]: ms
      - link "Symfony 7.4.0" [ref=e163] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/9ab958?panel=config
        - generic [ref=e164]:
          - img "Symfony" [ref=e166]
          - generic [ref=e168]: 7.4.0
      - generic [ref=e170]:
        - img [ref=e172]
        - generic [ref=e175]: Server
      - button [expanded] [ref=e176] [cursor=pointer]:
        - generic "Close Toolbar" [ref=e177]:
          - img [ref=e178]
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
  47 |     await page.locator('input[name="_username"]').fill('inconnu@test.fr');
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
> 67 |     await expect(page).toHaveURL(/\/(fr\/?)?$/);
     |                        ^ Error: expect(page).toHaveURL(expected) failed
  68 |   });
  69 | });
```