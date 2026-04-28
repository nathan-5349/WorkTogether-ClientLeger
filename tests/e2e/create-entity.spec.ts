import { test, expect } from '@playwright/test';
import { login, USERS } from './auth-helper';

/**
 * Tests du profil client (CustomerController).
 *
 * Routes couvertes :
 *   GET  /fr/customer/profile
 *   GET  /fr/customer/edit
 *   POST /fr/customer/edit
 *   GET  /fr/customer/change-password
 */
test.describe('Profil client', () => {
  test.beforeEach(async ({ page }) => {
    await login(page, USERS.particular.email, USERS.particular.password);
  });

  test('La page de profil affiche les informations du client', async ({ page }) => {
    await page.goto('/fr/customer/profile');

    // Le template profile.html.twig affiche prénom, nom, email (fixtures : Jean Durand)
    await expect(page.locator('.profile-field__val').first()).toBeVisible();

    // Les deux boutons d'action sont présents
    await expect(page.getByRole('link', { name: /modifier/i })).toBeVisible();
    await expect(page.getByRole('link', { name: /mot de passe/i })).toBeVisible();
  });

  test('Un client particulier voit sa civilité sur son profil', async ({ page }) => {
    await page.goto('/fr/customer/profile');

    // La section "Civilité" n'est affichée que pour les Particular (template Twig : if user.isParticular)
    const civility = page.locator('.profile-field__label', { hasText: /civilité/i });
    await expect(civility).toBeVisible();
  });

  test('Le formulaire d\'édition est pré-rempli avec les données du client', async ({ page }) => {
    await page.goto('/fr/customer/edit');

    // ParticularRegistrationType : champs firstName, name, email, phone, adress, invoiceAdress, gender
    await expect(page.locator('input[name*="firstName"]')).toHaveValue('Jean');
    await expect(page.locator('input[name*="name"]')).not.toHaveValue('');
    await expect(page.locator('input[name*="email"]')).toHaveValue(USERS.particular.email);
  });

  test("Un client peut modifier son numéro de téléphone", async ({ page }) => {
    await page.goto('/fr/customer/edit');

    const phoneInput = page.locator('input[name*="phone"]');
    await phoneInput.fill('0699887766');

    await page.getByRole('button', { name: /sauvegarder/i }).click();

    // Redirigé vers le profil après succès
    await expect(page).toHaveURL(/\/customer\/profile/);

    // Vérifie que le nouveau numéro est affiché
    await expect(page.locator('.profile-field__val', { hasText: '0699887766' })).toBeVisible();

    // Remet la valeur d'origine pour ne pas casser les autres tests
    await page.goto('/fr/customer/edit');
    await page.locator('input[name*="phone"]').fill('0601010101');
    await page.getByRole('button', { name: /sauvegarder/i }).click();
  });

  test('Le changement de mot de passe échoue si le mot de passe actuel est incorrect', async ({ page }) => {
    await page.goto('/fr/customer/change-password');

    await page.locator('input[name*="currentPassword"]').fill('mauvais_mdp');
    await page.locator('input[name*="password"][id*="first"]').fill('NouveauMdp123!');
    await page.locator('input[name*="password"][id*="second"]').fill('NouveauMdp123!');

    await page.getByRole('button', { name: /mettre à jour/i }).click();

    // CustomerController ajoute un flash 'error' et redirige
    await expect(page).toHaveURL(/\/customer\/change-password/);
    await expect(page.locator('.wt-flash--error')).toBeVisible();
  });
});