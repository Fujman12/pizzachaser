#!pvenv/bin/python
import os
import warnings
warnings.filterwarnings("ignore")

basedir = os.path.abspath(os.path.dirname(__file__))

try:
    from app import config_mysql
    os.environ['DATABASE_URL'] = 'mysql://%s:%s@localhost/%s' % (
        config_mysql.username, config_mysql.password, config_mysql.db)

except ImportError:
    #os.environ['DATABASE_URL'] = 'sqlite:///' \
    #    + os.path.join(basedir, 'app/app.db')
    os.environ['DATABASE_URL'] = 'mysql://pizzachaser:1q2w3e@localhost/pizzadb' 

from flup.server.fcgi import WSGIServer

from app import create_app, db
from flask_script import Manager, Shell
from flask_migrate import Migrate, MigrateCommand

main_app = create_app('production')
manager = Manager(main_app)
migrate = Migrate(main_app, db)

if __name__ == '__main__':
    WSGIServer(main_app).run()