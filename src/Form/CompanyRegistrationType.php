<?php

namespace App\Form;

use App\Entity\Company;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class CompanyRegistrationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('firstName' , null , ['label' => 'Prénom'])
            ->add('name', null , ['label' => 'Nom'])
            ->add('email', null , ['label' => 'Email']);

        if (!$options['is_edit']) {
        $builder->add('password', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'Les mots de passe ne correspondent pas.',
                'required' => true,
                'first_options'  => ['label' => 'Mot de passe'],
                'second_options' => ['label' => 'Confirmer le mot de passe'],
            ]);
        }
        $builder
            ->add('phone', null , ['label' => 'Téléphone'])
            ->add('adress', null , ['label' => 'Adresse'])
            ->add('invoiceAdress', null , ['label' => 'Adresse de facturation'])
            ->add('siret')
            ->add('companyName')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Company::class,
            'is_edit' => false,
        ]);
    }
}
