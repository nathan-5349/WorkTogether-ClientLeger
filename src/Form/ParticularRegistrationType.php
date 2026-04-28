<?php

declare(strict_types=1);

namespace App\Form;

use App\Entity\Particular;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ParticularRegistrationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('firstName', null, ['label' => 'Prénom'])
            ->add('name', null, ['label' => 'Nom'])
            ->add('email', null, ['label' => 'Email']);

        if (!$options['is_edit']) {
            $builder->add('password', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'Les mots de passe ne correspondent pas.',
                'required' => true,
                'first_options' => ['label' => 'Mot de passe'],
                'second_options' => ['label' => 'Confirmer le mot de passe'],
            ]);
        }
        $builder
            ->add('phone', null, ['label' => 'Téléphone'])
            ->add('adress', null, ['label' => 'Adresse'])
            ->add('invoiceAdress', null, ['label' => 'Adresse de facturation'])
            ->add('gender', ChoiceType::class, [
                'label' => 'Genre',
                'expanded' => true,
                'choices' => [
                    'Monsieur' => 'Monsieur',
                    'Madame' => 'Madame',
                ],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Particular::class,
            'is_edit' => false,
        ]);
    }
}
