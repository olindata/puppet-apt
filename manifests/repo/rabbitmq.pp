class apt::repo::rabbitmq {

  # Add RabbitMQ repository
  apt::key { '056E8E56' :
    keyserver => 'pgp.mit.edu',
  }

  # deb http://www.rabbitmq.com/debian/ testing main
  apt::repository { 'rabbitmq' :
    url         => 'http://www.rabbitmq.com/debian',
    distro      => 'testing',
    repository  => 'main',
    require    => Apt::Key['056E8E56']
  }
}

