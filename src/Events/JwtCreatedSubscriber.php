<?php

namespace App\Events;

use App\Entity\Client;
use App\Entity\Employe;
use Lexik\Bundle\JWTAuthenticationBundle\Event\JWTCreatedEvent;

class JwtCreatedSubscriber {

    //On vas s'abbonner à l'évènement concernant la création du token
    //A chaque creation d'un token la méthode onJwtCreated vas s'exécuter
    public function onJwtCreated(JWTCreatedEvent $createdEvent) {
        // On vas ajouter le firstname et la lastname dans le payload
        // 1. Récupérer le Users
        $user = $createdEvent->getUser();

        // 2. Récupérer le payload
        $payload = $createdEvent->getData();
        $payload["nom"] = $user->getNom();
        $payload["prenom"] = $user->getPrenom();

        if ($user instanceof Employe) $payload["rolePower"] = $user->getIdRole()->getPower();
        else $payload["rolePower"] = 0;

        // 3. Set le payload
        $createdEvent->setData($payload);
    }
}