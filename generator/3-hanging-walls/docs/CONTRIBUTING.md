# Contributing

__TODO: Thank people for being here__

## Creating an Issue

__TODO: Replase "edu-demo" with the project name__

Before you start fixing problems or adding value to edu-demo, it may be at your behest to find something to complain about first!

Loads of issues have likely been filed before you show up, but now is your opportunity to submit your request to the proverbial complaint box

Existing templates for issues are present so you can create an issue in a guided manner, and using one is as simple as [going here](https://github.com/ExoKomodo/edu-demo/issues/new/choose)

## Fixing an issue

__TODO: Introduce the user that you will be explaining how to do a PR now__

### Creating a branch

#### Team member

__TODO: Explain how a user can make a branch__

I cannot stress this enough, but **DO NOT USE A [FORK](https://docs.github.com/en/get-started/quickstart/fork-a-repo)**

Forks are frustrating to work with, as they are:
- difficult to know what is actually being worked on
- difficult to keep in-sync

#### Helpful user

__TODO: Explain how a user can make a branch__

I am sad to say, you must use a [fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo)

A fork is a copy of this repository, but nested under your user namespace

For example, [James Orson](https://www.exokomodo.com/jorson) has a [fork of Edu](https://github.com/JamesOrson/Edu) under [his namespace](https://github.com/JamesOrson)

<img width="1717" alt="Screenshot 2023-03-29 at 7 56 25 AM" src="https://user-images.githubusercontent.com/17893076/228579896-91ff5434-62b4-48e7-81b3-578e0448cc0a.png">

Now you can push to the `main` branch of your fork directly and not clobber anything on the actual [Edu repo](https://github.com/ExoKomodo/Edu)

### Creating a pull request

__TODO: Explain how a user creates a PR__

The moment you create a branch to work on an issue, you should go ahead and create a `Draft pull request`

By having a draft pull request, you signal CI to start automatically building and testing your changes, preparing you for merge!

You can technically develop without ever running the code yourself, by delegating your testing to the CI system, but making changes like CSS updates don't make sense to only let the CI handle because you must see the change yourself

#### Team members

### Syncing changes from main

#### Team members

__TODO: Explain how a user syncs changes from main branch__

Say the `main` branch is updated before you can merge your change in, no biggie

You have 2 options:
- Update the branch in the Github UI
<img width="916" alt="Screenshot 2023-03-29 at 8 03 15 AM" src="https://user-images.githubusercontent.com/17893076/228582048-f242d46c-e8af-462b-abb3-2cb6e505decb.png">
- Update the branch locally

```shell
git checkout main
git pull
git checkout my-branch
# Now pick one of these following two
## 1. rebase
git rebase main
## 2. merge
git merge main
```

#### Helpful user

##### Updating a PR

__TODO: Explain how a user syncs changes from main branch__

Update a PR branch in the Github UI
<img width="916" alt="Screenshot 2023-03-29 at 8 03 15 AM" src="https://user-images.githubusercontent.com/17893076/228582048-f242d46c-e8af-462b-abb3-2cb6e505decb.png">

##### Updating a fork's `main`

__TODO: Explain how a fork syncs changes from main branch__

To keep your fork up-to-date, you can do this in the home page of your fork, by clicking the `Sync fork` button
<img width="1140" alt="Screenshot 2023-03-29 at 7 58 11 AM" src="https://user-images.githubusercontent.com/17893076/228580555-1930402d-0d02-4e5b-9448-2db2b76743a2.png">

### Closing a pull request

__TODO: Explain how to consider a PR done and able to be closed__

Once the CI is happy, and an ExoKomodo developer has reviewed your changes, go ahead and merge your PR!
