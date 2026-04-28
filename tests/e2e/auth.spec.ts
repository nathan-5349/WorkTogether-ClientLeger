import { test, expect } from '@playwright/test';
import { login, USERS } from './auth-helper';
/**
 * Tests de connexion basés sur les fixtures AppFixtures.php.
 *
 * Le DashboardController redirige selon le rôle :
 *   ROLE_ADMIN        → /fr/admin/dashboard
 *   ROLE_ACCOUNTANT   → /fr/accountant/dashboard
 *   ROLE_SUPPORT      → /fr/support/dashboard
 *   ROLE_TECHNICIAN   → /fr/technician/dashboard
 *   ROLE_CUSTOMER     → /fr/customer/dashboard
 */
test.describe('Connexion utilisateur', () => {
  test('Un client particulier peut se connecter et arrive sur son dashboard', async ({ page }) => {
    await login(page, USERS.particular.email, USERS.particular.password);

    // DashboardController → app_customer_dashboard
    await expect(page).toHaveURL(/\/customer\/dashboard/);

    // Le dashboard affiche le prénom de l'utilisateur (Jean, depuis les fixtures)
    await expect(page.locator('.dash-name')).toContainText(/Jean/);
  });

  test('Un client entreprise peut se connecter', async ({ page }) => {
    await login(page, USERS.company.email, USERS.company.password);

    await expect(page).toHaveURL(/\/customer\/dashboard/);
    // Marc Leroy — company@test.fr
    await expect(page.locator('.dash-name')).toContainText(/Marc/);
  });

  test("L'admin peut se connecter et arrive sur le dashboard admin", async ({ page }) => {
    await login(page, USERS.admin.email, USERS.admin.password);

    await expect(page).toHaveURL(/\/admin\/dashboard/);
  });

  test('Un technicien peut se connecter', async ({ page }) => {
    await login(page, USERS.technician.email, USERS.technician.password);

    await expect(page).toHaveURL(/\/technician\/dashboard/);
  });

  test('Des identifiants incorrects affichent un message d\'erreur', async ({ page }) => {
    await page.goto('/login');

    await page.locator('input[name="_username"]').fill('inconnu@test.fr');
    await page.locator('input[name="_password"]').fill('mauvais_mdp');
    await page.getByRole('button', { name: /se connecter/i }).click();

    // Reste sur /login
    await expect(page).toHaveURL(/\/login/);

    // Le template login.html.twig affiche error.messageKey via security.fr.yaml
    // → "Identifiants invalides."
    await expect(page.locator('.alert-danger, [class*="alert"]')).toBeVisible();
  });

  test('Un utilisateur peut se déconnecter', async ({ page }) => {
    await login(page, USERS.particular.email, USERS.particular.password);
    await expect(page).toHaveURL(/\/customer\/dashboard/);

    // Lien de déconnexion dans la navbar (base.html.twig)
    await page.getByRole('link', { name: /déconnexion/i }).click();

    // Après logout, retour sur la page d'accueil ou /login
    await expect(page).toHaveURL(/\/(fr\/?)?$/);
  });
});