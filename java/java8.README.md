# Optional

        return this.accountRepository.findByUsername(username)
                .map(account -> new User(account.getUsername(),
                        account.getPassword(),
                        account.isActive(), account.isActive(), account.isActive(), account.isActive(),
                        AuthorityUtils.createAuthorityList("ROLE_ADMIN", "ROLE_USER")
                ))
                .orElseThrow(() -> new UsernameNotFoundException("couldn't find " + username + "!"));

# Stream

        Stream.of("pwebb,boot", "dsyer,cloud", "jlong,spring", "rod,atomist")
                .map(x -> x.split(","))
                .forEach(tuple -> accountRepository.save(new Account(tuple[0], tuple[1], true)));


