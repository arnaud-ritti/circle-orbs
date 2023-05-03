dev=22

init:
	circleci orb create agence-adeliom/${project} --no-prompt || true

pack:
	circleci orb pack ${project}/src/ > ${project}.yaml

validate:
	make init project=${project}
	make pack project=${project}
	circleci orb validate ${project}.yaml

publish-dev:
	make pack project=${project}
	circleci orb publish ${project}.yaml agence-adeliom/${project}@dev:${dev}

publish:
	make publish-dev project=${project}
	circleci orb publish promote agence-adeliom/${project}@dev:${dev} patch
