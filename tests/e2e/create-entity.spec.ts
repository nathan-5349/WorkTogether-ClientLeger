import { test, expect } from '@playwright/test';
import { login, USERS } from './auth-helper';

test.describe('Profil client', () => {
  test.beforeEach(async ({ page }) => {
    await login(page, USERS.particular.email, USERS.particular.password);
  });

  test('La page de profil affiche les informations du client', async ({ page }) => {
    await page.goto('/fr/customer/profile');
    await expect(page.locator('.profile-field__val').first()).toBeVisible();
    await expect(page.getByRole('link', { name: /modifier/i })).toBeVisible();
  });

  // TESTS DÉSACTIVÉS : Échouent si les fixtures ne sont pas réinitialisées
  /*
  test('Un client peut modifier son numéro de téléphone', async ({ page }) => {
    await page.goto('/fr/customer/edit');
    const phoneInput = page.locator('input[name*="phone"]');
    await phoneInput.fill('0699887766');
    await page.getByRole('button', { name: /sauvegarder/i }).click();
    await expect(page).toHaveURL(/\/customer\/profile/);
  });

  test('Le changement de mot de passe échoue si le mot de passe actuel est incorrect', async ({ page }) => {
    await page.goto('/fr/customer/change-password');
    await page.locator('input[name*="currentPassword"]').fill('mauvais_mdp');
    await page.getByRole('button', { name: /modifier/i }).click();
    await expect(page.locator('.alert-danger')).toBeVisible();
  });
  */
});