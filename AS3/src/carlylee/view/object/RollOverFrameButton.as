package carlylee.view.object
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.data.manager.SoundManager;
	import game.define.SOUND;
	
	/**
	 * RollOverFrameButton
	 * 
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: June 5, 2014
	 */
	public class RollOverFrameButton extends Sprite	
	{
		public var id:int;
		public var isOn:Boolean = false;
		public var soundEffect:Boolean = true;
		public var data:Object;
		
		private var _clip:MovieClip;
		private var _labelMode:Boolean = false;
		private var _onFrame:String = "2";
		
		public function RollOverFrameButton( $clip:MovieClip, $id:int=0, $isLabelMode:Boolean=false, $addChild:Boolean=false )
		{
			_clip = $clip;
			if( $addChild ) this.addChild( _clip );
			this.id = $id;
			_labelMode = $isLabelMode;
			this.setEnable();
		}
		
		public function setDisable():void{
			if( _labelMode ){
				_clip.gotoAndStop( "disable" );
			}else{
				_clip.gotoAndStop( 4 );
			}
			_clip.buttonMode = false;
			_clip.mouseChildren = _clip.mouseEnabled = false;
			this.mouseChildren = this.mouseEnabled = false;
			_clip.removeEventListener( MouseEvent.MOUSE_DOWN, onDown );
			_clip.removeEventListener( MouseEvent.ROLL_OVER, onOver );
			_clip.removeEventListener( MouseEvent.ROLL_OUT, onOut );
		}
		
		public function setEnable():void{
			this.onOut();
			_clip.buttonMode = true;
			_clip.mouseChildren = _clip.mouseEnabled = true;
			this.mouseChildren = this.mouseEnabled = true;
			_clip.addEventListener( MouseEvent.ROLL_OVER, onOver );
			_clip.addEventListener( MouseEvent.ROLL_OUT, onOut );
			_clip.addEventListener( MouseEvent.MOUSE_DOWN, onDown );
		}
		
		public function setOn( $frame:String="2" ):void{
			this.isOn = true;
			_onFrame = $frame;
			this.onOver();
		}
		
		public function setOff():void{
			this.isOn = false;
			this.onOut();
		}
		
		private function onOver( $e:MouseEvent=null ):void{
			if( _labelMode ){
				_clip.gotoAndStop( "over" );
			}else{
				_clip.gotoAndStop( _onFrame );
			}
			if( soundEffect && $e!=null ) SoundManager.getInstance().play( SOUND.MOUSE_OVER );
			if( $e!=null ) this.dispatchEvent( $e );
		}
		
		private function onOut( $e:MouseEvent=null ):void{
			if( isOn ) return;
			if( _labelMode ){
				_clip.gotoAndStop( "out" );
			}else{
				_clip.gotoAndStop( 1 );
			}
			if( $e!=null ) this.dispatchEvent( $e );
		}
		
		private function onDown( $e:MouseEvent ):void{
			if( _labelMode ){
				_clip.gotoAndStop( "click" );
			}else{
				_clip.gotoAndStop( 3 );
			}
			_clip.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
		}
		
		private function onMouseUp( $e:MouseEvent ):void{
			this.dispatchEvent( new MouseEvent( MouseEvent.CLICK ));
			_clip.gotoAndStop( _onFrame );
			this.onOut();
		}
	}
}