import yaml
import sys

if __name__ == '__main__':
    fl = sys.argv[1]
    errors = 0
    with open(fl, 'r') as stream:
        for k, v in yaml.load(stream)['env_variables'].iteritems():
            if '\0' in k or '\0' in v:
                errors = 1
                continue
            sys.stdout.write('%s\0%s\0' % (k, v))
    sys.exit(saw_errors)

