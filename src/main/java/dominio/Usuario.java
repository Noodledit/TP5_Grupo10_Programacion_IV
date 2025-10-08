package dominio;

public class Usuario {

	private int idUsuario;
	private String usuario;
	private String contrasenia;
	
	public Usuario() {
	}
	
	public Usuario(int idUsuario, String usuario, String contrasenia) {
		this.idUsuario = idUsuario;
		this.usuario = usuario;
		this.contrasenia = contrasenia;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
}
