# Host It

## Prerequisites

- Ruby (see .ruby-version)
- Node.js (see .nvmrc)
- Docker and Docker Compose
- Yarn

## Setup

### Environment Variables

Create a `.env` file with the following variables:

    POSTGRES_PASSWORD=password
    CLOUDINARY_URL=your_cloudinary_url
    SPOTIFY_CLIENT_ID=your_spotify_client_id
    SPOTIFY_CLIENT_SECRET=your_spotify_client_secret

### Database

Start PostgreSQL:

    docker-compose up -d

### Installation

    # Install Ruby dependencies
    bundle install

    # Install Node dependencies
    yarn install

    # Setup database
    rails db:create
    rails db:migrate
    rails db:seed

### Running the application

    # Start the Rails server
    rails server

    # In another terminal, start the webpack dev server
    bin/webpack-dev-server

## Services Used

- PostgreSQL for database
- Cloudinary for image storage
- Spotify API for music integration
