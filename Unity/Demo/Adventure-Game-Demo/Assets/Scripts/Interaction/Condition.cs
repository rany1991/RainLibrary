using System;
using UnityEngine;

/*
 * 1. 用于判断条件是否符合
 * 
 * 2. 如果条件检验通过, 用React方法最初反馈
 * 
 */ 

[Serializable]
public class Condition
{
	//检查GameObject
    [Serializable]
    public class GameObjectCondition
    {
        public GameObject gameObject;
        public bool activityState;


        public bool TryCheck ()
        {
            bool isConditionMet;

            if (gameObject)
            {
				isConditionMet = (gameObject.activeSelf == activityState);
            }
            else
            {
                isConditionMet = true;
            }

            return isConditionMet;
        }
    }


	//检查已装备的物品
    [Serializable]
    public class EquippedItemCondition
    {
        public Item equippedItem;


        public bool TryCheck (Inventory inventory)
        {
            bool isConditionMet;

            if (equippedItem)
            {
                isConditionMet = inventory.IsItemEquipped(equippedItem);
            }
            else
            {
                isConditionMet = true;
            }

            return isConditionMet;
        }
    }


	//检查背包中所携带的物品
    [Serializable]
    public class CarriedItemCondition
    {
        public Item carriedItem;


        public bool TryCheck (Inventory inventory)
        {
            bool isConditionMet;

            if (carriedItem)
            {
                isConditionMet = inventory.IsItemCarried (carriedItem);
            }
            else
            {
                isConditionMet = true;
            }

            return isConditionMet;
        }
    }


	//检查可交互物品的条件
    [Serializable]
    public class InteractableCondition
    {
        public Interactable interactable;
        public bool usedState;


        public bool TryCheck ()
        {
            bool isConditionMet;

            if (interactable)
            {
				isConditionMet = (interactable.isUsed == usedState);
            }
            else
            {
                isConditionMet = true;
            }

            return isConditionMet;
        }
    }


	//配置属性
    public string description;
    public GameObjectCondition[] gameObjectConditions;
    public EquippedItemCondition[] equippedItemConditions;
    public CarriedItemCondition[] carriedItemConditions;
    public InteractableCondition[] interactableConditions;
    public Reaction reaction;


	//判断所设条件是否符合要求
    public bool Check (Inventory inventory)
    {
        bool isConditionMet = true;

        for (int i = 0; i < gameObjectConditions.Length; i++)
        {
            isConditionMet = isConditionMet && gameObjectConditions[i].TryCheck ();
        }

        for (int i = 0; i < equippedItemConditions.Length; i++)
        {
            isConditionMet = isConditionMet && equippedItemConditions[i].TryCheck (inventory);
        }

        for (int i = 0; i < carriedItemConditions.Length; i++)
        {
            isConditionMet = isConditionMet && carriedItemConditions[i].TryCheck (inventory);
        }

        for (int i = 0; i < interactableConditions.Length; i++)
        {
            isConditionMet = isConditionMet && interactableConditions[i].TryCheck ();
        }

        return isConditionMet;
    }


	//做出相应反馈
    public void React ()
    {
		if (reaction != null) {
			reaction.React ();
		}
	}
}
