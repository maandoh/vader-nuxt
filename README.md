# vader-nuxt

This is a web app written in Nuxt to run [vaderSentiment-js](https://github.com/vaderSentiment/vaderSentiment-js), 
Javascript port of [VADER Sentiment Analysis tool](https://github.com/cjhutto/vaderSentiment).

VADER Sentiment Analysis. VADER (Valence Aware Dictionary and sEntiment Reasoner) is a lexicon and rule-based sentiment analysis tool that is specifically attuned to sentiments expressed in social media, and works well on texts from other domains.

## Online demo

Try it out at [https://vader.casadi.la](https://vader.casadi.la).


## Running this project

Choose either of the following:

### Running locally

Clone this repo:

    # install dependencies
    $ yarn install

    # serve with hot reload at localhost:3000
    $ yarn dev
    
Access this application in your browser at `http://localhost:3000`.
    
### Running with Docker Compose

Clone this repo and run:

    sudo docker-compose up
    
Or, download the the `docker-compose.yml` file and run:

    $ curl -sSL https://raw.githubusercontent.com/maandoh/vader-nuxt/main/docker-compose.yml > docker-compose.yml
    $ docker-compose up -d
    
### Running with Docker

From any command line, run:

    docker run -p 3000:3000 maandoh/vader-nuxt    

## Links
    
GitHub: [https://github.com/maandoh/vader-nuxt](https://github.com/maandoh/vader-nuxt)

DockerHub: [https://hub.docker.com/r/maandoh/vader-nuxt](https://hub.docker.com/r/maandoh/vader-nuxt)

For detailed explanation on how Nuxt works, check out the [documentation](https://nuxtjs.org).
    
## Contributor

- [James Ma](https://github.com/jamesmawm)
