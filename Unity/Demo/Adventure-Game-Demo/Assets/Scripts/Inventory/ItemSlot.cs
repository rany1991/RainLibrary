using UnityEngine;
using UnityEngine.UI;

/*
 * 用于显示背包系统的UI表现 
 * 
 */ 

public class ItemSlot : MonoBehaviour
{	
    public Item currentItem;
    public Image itemImage;
    public Image highlightImage;
    public GameObject equipButtonGameObject;


	//更新选中ItemSlot的高光图片的显示/隐藏
    public void UpdateHighlight (bool isSelected)
    {
        highlightImage.enabled = isSelected;

        if (currentItem)
        {
            equipButtonGameObject.SetActive (isSelected && currentItem.isEquipable);
        }
        else
        {
            equipButtonGameObject.SetActive (false);
        }
    }

	//更新选中ItemSlot的物品显示和隐藏
    public void UpdateItem ()
    {
        if (currentItem)
        {
            itemImage.enabled = true;
            itemImage.sprite = currentItem.sprite;
        }
        else
        {
            itemImage.enabled = false;
        }
    }
}
