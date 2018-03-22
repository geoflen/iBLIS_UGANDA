<?php

class TestPhase extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'test_phases';
	
	public $timestamps = false;

	/**
	 * Test Phase constants
	 */
	const PRE_ANALYTICAL = 1;
	const ANALYTICAL = 2;
	const POST_ANALYTICAL = 3;

	/**
	 * TestStatus relationship
	 */
    public function testStatuses()
    {
        return $this->hasMany('TestStatus');
    }

}