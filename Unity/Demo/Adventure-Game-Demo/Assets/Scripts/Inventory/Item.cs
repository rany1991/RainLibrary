using UnityEngine;


/* 
 * 1. 用于保存可搜集物品的数据
 * 2. 可以通过Create菜单生成ScriptableObject资源
 */

[CreateAssetMenu]
public class Item : ScriptableObject
{
	//用于代表某个物品的图片
    public Sprite sprite;

	//用于表示一个物品是否可以被穿戴
    public bool isEquipable;
}
