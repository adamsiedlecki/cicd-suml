install:
	pip install --upgrade pip && \
	pip install -r requirements.txt

format:
	python -m black *.py

train:
	python train.py

eval:
	echo "## Model Metrics" > report.md
	cat ./Results/metrics.txt >> report.md
   
	echo '\n## Confusion Matrix Plot' >> report.md
	echo '![Confusion Matrix](./Results/model_results.png)' >> report.md
   
	cml comment create report.md

update-branch:
	git config --global user.name $(USER_NAME)
	git config --global user.email $(USER_EMAIL)
	git add Model/drug_pipeline.skops
	git add Results/model_results.png
	git add Results/metrics.txt
	git commit -am "Update with new results"
	git push --force origin HEAD:update