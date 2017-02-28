using System;
using System.Collections;
using UnityEngine;

/*
 * 1. 用于Market和SecurityRoom场景
 * 
 * 2. 按照配置做出相应的反馈, 包括: 动画,声音,
 * 
 */

public class Reaction : MonoBehaviour
{
	//[Serializable] 可以让子类显示在Inspector窗口

	//动画反馈
    [Serializable]
    public class AnimationReaction
    {
        public Animator animator;
        public string animatorTrigger;
        public float delay;

		//做出反馈 (使用IEnumerator作为返回类型, 是因为要用到 WaitForSeconds来做延迟)
        public IEnumerator React ()
        {
            if (animator)
            {
                yield return new WaitForSeconds (delay);

                animator.SetTrigger (animatorTrigger);
            }
        }
    }


	//声音反馈
    [Serializable]
    public class AudioReaction
    {
        public AudioSource audioSource;
        public AudioClip audioClip;
        public float delay;

		//做出反馈
        public void React ()
        {
            if (audioSource && audioClip)
            {
                audioSource.clip = audioClip;
                audioSource.PlayDelayed (delay);
            }
        }
    }


	//Behaviour反馈
    [Serializable]
    public class BehaviourReaction
    {
        public Behaviour behaviourToEnable;
        public Behaviour behaviourToDisable;
        public float delay;

		//做出反馈 (使用IEnumerator作为返回类型, 是因为要用到 WaitForSeconds来做延迟)
        public IEnumerator React ()
        {
            yield return new WaitForSeconds (delay);

            if (behaviourToEnable)
            {
                behaviourToEnable.enabled = true;
            }

            if (behaviourToDisable)
            {
                behaviourToDisable.enabled = false;
            }
        }
    }


	//GameObject隐藏和显示反馈
    [Serializable]
    public class GameObjectReaction
    {
        public GameObject gameObjectToActivate;
        public GameObject gameObjectToDeactivate;
        public float delay;

		//做出反馈 (使用IEnumerator作为返回类型, 是因为要用到 WaitForSeconds来做延迟)
        public IEnumerator React ()
        {
            yield return new WaitForSeconds (delay);

            if (gameObjectToActivate)
            {
                gameObjectToActivate.SetActive (true);
            }
            if (gameObjectToDeactivate)
            {
                gameObjectToDeactivate.SetActive (false);
            }
        }
    }


	//物品的显示和隐藏反馈
    [Serializable]
    public class ItemReaction
    {
        public Item pickedUpItem;
        public Item lostItem;
        public float delay;

		//做出反馈 (使用IEnumerator作为返回类型, 是因为要用到 WaitForSeconds来做延迟)
        public IEnumerator React (Inventory inventory)
        {
            yield return new WaitForSeconds (delay);

            if (lostItem)
            {
                inventory.RemoveItem (lostItem);
            }
            if (pickedUpItem)
            {
                inventory.AddItem (pickedUpItem);
            }
        }
    }


	//场景的加载
    [Serializable]
    public class SceneReaction
    {
        public bool loadAScene;
        public string sceneToLoad;
        public PersistentDataObject playerLocationPersistentDataObject;
        public Vector3 playerPosInLoadedScene;
        public Vector3 playerRotInLoadedScene;

		//做出反馈
        public void React (SceneController sceneController)
        {
            if (loadAScene)
            {
                playerLocationPersistentDataObject.position = playerPosInLoadedScene;
                playerLocationPersistentDataObject.rotation = Quaternion.Euler (playerRotInLoadedScene);
                sceneController.FadeAndLoadScene (sceneToLoad);
            }
        }
    }


	//文字反馈
    [Serializable]
    public class TextReaction
    {
        public TextManager textManager;
        public string message;
        public Color textColor = Color.white;
        public float delay;

		//做出反馈
        public void React ()
        {
            if (textManager)
            {
                textManager.DisplayMessage (message, textColor, delay);
            }
        }
    }


	//把已经交互过的物品设为已被使用
    [Serializable]
    public class UsedInteractableReaction
    {
        public Interactable interactable;


        public void React ()
        {
            if (interactable)
            {
                interactable.isUsed = true;
            }
        }
    }


	//可配置的属性
    public AnimationReaction[] animationReactions;
    public AudioReaction[] audioReactions;
    public BehaviourReaction[] behaviourReactions;
    public GameObjectReaction[] gameObjectReactions;
    public ItemReaction[] itemReactions;
    public SceneReaction sceneReaction;
    public TextReaction textReaction;
    public UsedInteractableReaction[] usedInteractableReactions;


    private Inventory inventory;
    private SceneController sceneController;


    private void Start ()
    {
		//找到场景中的Inventory
        inventory = FindObjectOfType<Inventory> ();
        
		//找到场景中的SceneController
		sceneController = FindObjectOfType<SceneController> ();
    }


	//按照配置执行所有的反馈操作
    public void React ()
    {
		//动画反馈
        for (int i = 0; i < animationReactions.Length; i++)
        {
            StartCoroutine (animationReactions[i].React ());
        }

		//声音反馈
        for (int i = 0; i < audioReactions.Length; i++)
        {
            audioReactions[i].React ();
        }

		//Behaviour反馈
        for (int i = 0; i < behaviourReactions.Length; i++)
        {
            StartCoroutine (behaviourReactions[i].React ());
        }

		//GameObject显示和隐藏反馈
        for (int i = 0; i < gameObjectReactions.Length; i++)
        {
            StartCoroutine (gameObjectReactions[i].React ());
        }

		//物品的显示和隐藏反馈
        for (int i = 0; i < itemReactions.Length; i++)
        {
            StartCoroutine (itemReactions[i].React (inventory));
        }

		//场景的加载反馈
        sceneReaction.React(sceneController);

		//文字反馈
        textReaction.React ();

		//设置可交互物体是否已交互过
        for (int i = 0; i < usedInteractableReactions.Length; i++)
        {
            usedInteractableReactions[i].React ();
        }
    }
}
