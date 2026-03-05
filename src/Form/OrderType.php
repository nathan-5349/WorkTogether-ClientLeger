<?php

namespace App\Form;

use App\Entity\Reservation;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('beginDate', null, [
                'widget' => 'single_text',
                'label' => 'Date de début',
            ])
            ->add('duration', ChoiceType::class, [
                'label' => 'Type de location',
                'mapped' => false,
                'choices' => [
                    'Mensuelle' => 'monthly',
                    'Annuelle' => 'annual',
                ],
            ])
            ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Reservation::class,
        ]);
    }
}
