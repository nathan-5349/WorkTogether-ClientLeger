import { test, expect } from '@playwright/test';
 
/**
 * Test : une page protégée redirige vers /login
 *
 * Routes protégées selon security.yaml :
 *   - /fr/dashboard  → ROLE_USER
 *   - /fr/customer/* → ROLE_CUSTOMER
 *   - /fr/admin/*    → ROLE_ADMIN
 *   - /fr/order/*    → ROLE_CUSTOMER
 */
test.describe('Accès aux pages protégées sans authentification', () => {
  const protectedRoutes = [
    { path: '/fr/dashboard',        label: 'dashboard'         },
    { path: '/fr/order/reservations', label: 'réservations'   },
  ];
 
  for (const route of protectedRoutes) {
    test(`"${route.label}" redirige vers /login`, async ({ page }) => {
      await page.goto(route.path);
 
      // Symfony redirige vers /login (sans préfixe locale pour cette route)
      await expect(page).toHaveURL(/\/login/);
 
      // Vérifie que la page de connexion s'affiche bien
      await expect(page.locator('input[name="_username"]')).toBeVisible();
      await expect(page.locator('input[name="_password"]')).toBeVisible();
    });
  }
 
  test('La route /fr/offers est accessible publiquement', async ({ page }) => {
    // Selon security.yaml : path: ^/offer → PUBLIC_ACCESS
    await page.goto('/fr/offers');
    await expect(page).not.toHaveURL(/\/login/);
    // Le titre de la page offres est présent (messages_fr.yaml : offers.title)
    await expect(page.locator('h1')).toContainText(/offre/i);
  });
 
  test("La page d'accueil est accessible publiquement", async ({ page }) => {
    // path: ^/$ → PUBLIC_ACCESS
    await page.goto('/');
    await expect(page).not.toHaveURL(/\/login/);
  });
});