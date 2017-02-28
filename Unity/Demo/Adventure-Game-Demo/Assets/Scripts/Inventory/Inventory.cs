using UnityEngine;


/* 
 * 1. 用于Persistent场景
 * 2. 用于操作背包里的物品,包括UI表现
 * 
 */

public class Inventory : MonoBehaviour
{
	//用于保存已经戴上物品的UI
    public ItemSlot equippedItemSlot;

	//用于保存背包里物品的UI
    public ItemSlot[] carriedItemSlots;


	//初始化背包UI
    private void Start ()
    {
        UpdateItems ();
        UpdateHighlight (-1);
    }

	//往背包里添加物品
    public void AddItem (Item itemToAdd)
    {
        for (int i = 0; i < carriedItemSlots.Length; i++)
        {
            if (carriedItemSlots[i].currentItem == null)
            {
                carriedItemSlots[i].currentItem = itemToAdd;
                break;
            }
        }

		//更新背包UI
        UpdateItems();
    }

	//从背包里移除物品
    public void RemoveItem (Item itemToRemove)
    {
        for (int i = 0; i < carriedItemSlots.Length; i++)
        {
            if (carriedItemSlots[i].currentItem == itemToRemove)
            {
                carriedItemSlots[i].currentItem = null;
                break;
            }
        }

		//更新背包UI
        UpdateItems ();
    }


	//当UI上放在背包UI上的物品被点击时
    public void CarriedItemClicked (int index)
    {
        UpdateHighlight (index);
    }


	//当处于高亮显示的, 放在背包UI上的物品被点击时
    public void CarriedItemHighlightClicked ()
    {
        UpdateHighlight (-1);
    }

	//当UI上的Equip按钮被点击时触发
    public void CarriedItemEquipButtonClicked (int index)
    {
        Item previouslyEquipedItem = equippedItemSlot.currentItem;
        equippedItemSlot.currentItem = carriedItemSlots[index].currentItem;
        carriedItemSlots[index].currentItem = previouslyEquipedItem;

		//更新背包UI
		UpdateItems ();
        UpdateHighlight (-1);
    }


	//判断物品是否在背包中
    public bool IsItemCarried (Item item)
    {
        bool isItemCarried;

        if (item != null)
        {
            isItemCarried = false;

            for (int i = 0; i < carriedItemSlots.Length; i++)
            {
                if (carriedItemSlots[i].currentItem == item)
                {
                    isItemCarried = true;
                    break;
                }
            }
        }
        else
        {
            isItemCarried = true;
        }

        return isItemCarried;
    }


	//判断是否指定的物品已经被穿戴上了
    public bool IsItemEquipped (Item item)
    {
        bool isItemEquipped;

        if (item != null)
        {
			isItemEquipped = (equippedItemSlot.currentItem == item);
        }
        else
        {
            isItemEquipped = true;
        }

        return isItemEquipped;
    }


	//更新背包UI
    private void UpdateItems ()
    {
        for (int i = 0; i < carriedItemSlots.Length; i++)
        {
            carriedItemSlots[i].UpdateItem ();
        }

        equippedItemSlot.UpdateItem();
    }

	//更新处于选中状态的背包UI
    private void UpdateHighlight (int index)
    {
        for (int i = 0; i < carriedItemSlots.Length; i++)
        {
            bool isSelectedItem = i == index;
            carriedItemSlots[i].UpdateHighlight(isSelectedItem);
        }
    }
}
