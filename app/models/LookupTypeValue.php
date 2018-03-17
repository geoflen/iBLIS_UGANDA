<?php
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class LookupTypeValue extends Eloquent
{
	protected $table = "lookuptypevalue";

		/**
	* Relationship with districts
	*/
	public function lookuptype()
	{
		return $this->hasOne('LookupType','lookuptypeid','id');
	}
}

