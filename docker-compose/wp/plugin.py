import time
import threading
import psutil
from flask import Flask, jsonify

app = Flask(__name__)

# Variable globale pour stocker les métriques
metrics_data = {
    "cpu_usage": None,
    "ram_usage": None
}

# Fonction pour récupérer les métriques CPU et RAM toutes les 5 minutes
def update_metrics():
    while True:
        # Récupérer l'utilisation du CPU (en pourcentage)
        cpu_usage = psutil.cpu_percent(interval=1)

        # Récupérer l'utilisation de la mémoire RAM
        ram_info = psutil.virtual_memory()
        ram_usage = ram_info.percent

        # Mettre à jour les données dans la variable globale
        metrics_data["cpu_usage"] = cpu_usage
        metrics_data["ram_usage"] = ram_usage

        print(f"Updated metrics: CPU: {cpu_usage}%, RAM: {ram_usage}%")

        # Attendre 5 minutes avant la prochaine mise à jour (300 secondes)
        time.sleep(300)

# Démarrer un thread pour mettre à jour les métriques toutes les 5 minutes
threading.Thread(target=update_metrics, daemon=True).start()

# Route pour obtenir les métriques CPU et RAM
@app.route('/metrics', methods=['GET'])
def get_metrics():
    # Vérifier si les métriques ont été mises à jour
    if metrics_data["cpu_usage"] is None or metrics_data["ram_usage"] is None:
        return "Métriques pas encore disponibles, réessayez dans quelques instants.", 503

    # Retourner les métriques sous forme de texte (ou JSON si vous préférez)
    response = f"\n# HELP system_metrics_cpu_usage CPU usage in percentage.\n# TYPE system_metrics_cpu_usage gauge\nsystem_metrics_cpu_usage {metrics_data['cpu_usage']}\n# HELP system_metrics_ram_usage RAM usage in percentage.\n# TYPE system_metrics_ram_usage gauge\nsystem_metrics_ram_usage {metrics_data['ram_usage']}"
    return response

if __name__ == '__main__':
    # Lancer l'application Flask
    app.run(host='0.0.0.0', port=5000)