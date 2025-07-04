

Create virtual environment
```
python -m venv venv
```

Activate virtual environment
```
venv\Scripts\activate
```

Install dependencies from requirements.txt and initialise Robot Framework Browser
```
pip install -r requirements.txt
rfbrowser init
```

Run tests using command
```
robot -d results/ suites/
```