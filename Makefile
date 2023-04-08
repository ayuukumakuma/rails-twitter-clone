app bash:
	docker-compose exec app bash

migrate:
	docker-compose exec app bash -c "rails db:migrate"
