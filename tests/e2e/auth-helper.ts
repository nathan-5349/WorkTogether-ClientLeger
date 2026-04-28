import { Page } from '@playwright/test';

/**
 * Connecte un utilisateur via le formulaire de login WorkTogether.
 * Le locale par défaut est 'fr' (les routes sont préfixées /{_locale}/).
 */
export async function login(
  page: Page,
  email: string,
  password: string,
  locale = 'fr'
): Promise<void> {
  await page.goto(`/${locale}/login`);

  // Le template login.html.twig utilise name="_username" et name="_password"
  await page.locator('input[name="_username"]').fill(email);
  await page.locator('input[name="_password"]').fill(password);
  await page.getByRole('button', { name: /se connecter/i }).click();

  // Attend que la navigation post-login soit terminée
  await page.waitForURL((url) => !url.pathname.includes('/login'));
}

/** Credentials des fixtures AppFixtures.php */
export const USERS = {
  particular: { email: 'particular@test.fr', password: 'particular' },
  company:    { email: 'company@test.fr',    password: 'company'    },
  admin:      { email: 'admin@test.fr',      password: 'admin'      },
  accountant: { email: 'accountant@test.fr', password: 'staff123'   },
  support:    { email: 'support@test.fr',    password: 'staff123'   },
  technician: { email: 'tech1@test.fr',      password: 'tech123'    },
};