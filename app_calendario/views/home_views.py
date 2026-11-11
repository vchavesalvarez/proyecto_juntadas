from django.shortcuts import render

def index(request):
    context = {
        'titulo': 'Organizador de Grupos - Sprint 1',
        'mensaje': 'Estructura base del sistema en funcionamiento.'
    }
    return render(request, 'app_calendario/index.html', context)