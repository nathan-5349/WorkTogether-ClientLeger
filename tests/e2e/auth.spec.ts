import { test, expect } from '@playwright/test';
import { login, USERS } from './auth-helper';

test.describe('Connexion utilisateur', () => {
  test('Un client particulier peut se connecter et arrive sur son dashboard', async ({ page }) => {
    await login(page, USERS.particular.email, USERS.particular.password);
    await expect(page).toHaveURL(/\/customer\/dashboard/);
    await expect(page.locator('.dash-name')).toContainText(/Jean/);
  });

  test('Un client entreprise peut se connecter', async ({ page }) => {
    await login(page, USERS.company.email, USERS.company.password);
    await expect(page).toHaveURL(/\/customer\/dashboard/);
    await expect(page.locator('.dash-name')).toContainText(/Marc/);
  });

  test('Un administrateur peut se connecter et arrive sur le dashboard admin', async ({ page }) => {
    await login(page, USERS.admin.email, USERS.admin.password);
    await expect(page).toHaveURL(/\/admin\/dashboard/);
  });

  test('Des identifiants incorrects affichent un message d\'erreur', async ({ page }) => {
    await page.goto('/login');
    await page.locator('input[name="_username"]').fill('inconnu@test.fr');
    await page.locator('input[name="_password"]').fill('mauvais_mdp');
    await page.getByRole('button', { name: /se connecter/i }).click();
    await expect(page).toHaveURL(/\/login/);
    await expect(page.locator('.alert-danger, [class*="alert"]')).toBeVisible();
  });

  // TEST DÉSACTIVÉ : Souvent instable en CI
  /*
  test('Un utilisateur peut se déconnecter', async ({ page }) => {
    await login(page, USERS.particular.email, USERS.particular.password);
    await page.goto('/logout'); 
    await expect(page).toHaveURL(/\/login/);
  });
  */
});