<?php

namespace App\Listeners;

use App\Post;
use App\Notifications\ArticlePublished;
use Illuminate\Notifications\Notifiable;


class BlogEventSubscriber
{
    use Notifiable;

    /**
     * Handle blog creating events.
     *
     * @param $post
     */
    public function onCreated($post)
    {
        $post->notify(new ArticlePublished());
    }

    /**
     * Register the listeners for the subscriber.
     *
     * @param  Illuminate\Events\Dispatcher  $events
     */
    public function subscribe($events)
    {
        $events->listen(
            'eloquent.created: App\Post',
            'App\Listeners\BlogEventSubscriber@onCreated'
        );
    }
}
