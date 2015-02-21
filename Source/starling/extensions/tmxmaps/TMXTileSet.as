/*
 * Copyright (C) 2013 Felipe Borgiani
 * Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
 * TMX Maps extension for Starling Framework
 * By: Felipe Borgiani : http://felipeborgiani.com
 * Based on: https://gist.github.com/shaunus84/3216598
 * 
 * Last update: 22/06/2013
 */
package starling.extensions.tmxmaps
{
import flash.display.Bitmap;
import flash.utils.Dictionary;

import starling.events.EventDispatcher;

/**
	 * @author Felipe Borgiani
	 * Based on the original TMXTileSheet by Shaun Mitchell
	 */
	public class TMXTileSet extends EventDispatcher
	{
		// the name and file paths
		private var _name:String;
		private var _sheetFilename:String;
		// texture, atlas and loader
		private var _firstID:uint;
		private var _tileHeight:uint;
		private var _tileWidth:uint;
		//private var _embedded:Boolean;
		private var _spacing:uint;
		private var _margin:uint;
		// tiles
		private var _tiles:Vector.<TMXTile>;
		// properties
		private var _properties:Dictionary;

		public function TMXTileSet():void
		{
			_tiles = new Vector.<TMXTile>();
			_properties = new Dictionary();
		}

		public function loadTileSheet(name:String, tileWidth:uint, tileHeight:uint, startID:uint, spacing:uint, margin:uint):void
		{
			trace("creating TMX tilesheet");
			_name = name;
			_firstID = startID;

			_tileHeight = tileHeight;
			_tileWidth = tileWidth;
			
			_spacing = spacing;
			_margin = margin;
		}
		
		public function tileWithGID(gid:uint):TMXTile
		{
			for (var i:int = 0; i < _tiles.length; i++) 
			{
				if (_tiles[i].tileID == gid)
					return _tiles[i];
			}
			
			return null;
		}

		public function get firstID():uint
		{
			return _firstID;
		}
		
		public function get tiles():Vector.<TMXTile> 
		{
			return _tiles;
		}
		
		public function get properties():Dictionary 
		{
			return _properties;
		}
	}
}
