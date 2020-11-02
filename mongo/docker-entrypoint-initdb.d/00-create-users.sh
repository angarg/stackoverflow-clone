#!/bin/sh

mongo -- "$MONGO_INITDB_DATABASE" <<EOF
    var rootUser = '$MONGO_INITDB_ROOT_USERNAME';
    var rootPassword = '$MONGO_INITDB_ROOT_PASSWORD';
    var user = '$MONGO_INITDB_DATABASE_USERNAME';
    var passwd = '$MONGO_INITDB_DATABASE_PASSWORD';
    var admin = db.getSiblingDB('admin');
    admin.auth(rootUser, rootPassword);
    use admin;
    db.createUser(
        {
            user: user,
            pwd: passwd,
            roles: [
                {
                    role:"userAdminAnyDatabase",
                    db:"admin"
                },
                {
                    role:"dbAdminAnyDatabase",
                    db:"admin"
                }
            ]
        }
    );
    use stackoverflow;
    db.createUser(
        {
            user: user,
            pwd: passwd,
            roles: [
                {
                    role:"dbOwner",
                    db:"$MONGO_INITDB_DATABASE"
                }
            ]
        }
    );
EOF
