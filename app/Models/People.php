<?php

namespace app\Models;

require_once 'Model.php';

class People extends Model {
	protected $table = 'pessoas';

	public function findNumChildren($value) {
		//$sql = "select * from {$this->table} where {$field} like ?";
		$sql = "SELECT p.nome, sum((case when f.pessoas_id is not null then 1 else 0 end)) as numfilhos FROM pessoas p LEFT OUTER JOIN filhos f ON p.id = f.pessoas_id where p.nome like ? GROUP BY p.id";
		$find = $this->connection->prepare($sql);
		$find->bindValue(1, "%".$value."%");
		$find->execute();

		return $find->fetchAll();
	}

	public function findAllNumChildren() {
		//$sql = "select * from {$this->table} where {$field} like ?";
		$sql = "SELECT p.nome, sum((case when f.pessoas_id is not null then 1 else 0 end)) as numfilhos FROM pessoas p LEFT OUTER JOIN filhos f ON p.id = f.pessoas_id GROUP BY p.id";
		$find = $this->connection->prepare($sql);
		$find->execute();

		return $find->fetchAll();
	}

}
