import tkinter as tk
from tkinter import messagebox

class MainWindow:
    def __init__(self, root):
        self.root = root
        self.root.title("Organizador de Grupos - Sprint 1")
        self.root.geometry("400x300")
        
        self.lbl_title = tk.Label(root, text="Sistema de Gestión de Calendarios", font=("Arial", 14))
        self.lbl_title.pack(pady=20)
        
        self.btn_login = tk.Button(root, text="Iniciar Sesión", command=self.abrir_login)
        self.btn_login.pack(pady=10)
        
        self.btn_salir = tk.Button(root, text="Salir", command=root.quit)
        self.btn_salir.pack(pady=10)

    def abrir_login(self):
        messagebox.showinfo("Navegación", "Pantalla de autenticación en desarrollo.")