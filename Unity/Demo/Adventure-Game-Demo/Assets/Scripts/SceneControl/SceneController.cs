using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

/*
 * 1. 加载/切换场景
 * 2. 加载/保存所有的ScriptableObject
 * 
 * 用于Persistent场景中
 * 
 */
public class SceneController : MonoBehaviour
{
	//切换场景时用到的黑色图片
    public CanvasGroup faderCanvasGroup;

	//控制切换场景所用时长
    public float fadeDuration = 1f;

	//控制使用哪个场景作为起始场景
    public string startingSceneName = "SecurityRoom";

	//用于测试是否正在切换场景
    private bool isFading;


    private IEnumerator Start ()
    {
		//设置起始的切换场景所用图片的alpha值
        faderCanvasGroup.alpha = 1f;

		//加载起始场景
        yield return StartCoroutine(LoadSceneAndSetActive(startingSceneName));

		//将起始黑色场景切换图片淡出
        StartCoroutine (Fade (0f));
    }


	//用于切换场景的方法
    public void FadeAndLoadScene (string sceneName)
    {
        if (!isFading)
        {
            StartCoroutine(FadeAndSwitchScenes(sceneName));
        }
    }

	//做场景切换; 保存和加载ScriptableObject的数据
    private IEnumerator FadeAndSwitchScenes (string sceneName)
    {
		//渐渐显示黑色场景切换图片
        yield return StartCoroutine (Fade (1f));

		//保存数据
        SaveAllPersistentData ();

		//写在当前场景
        SceneManager.UnloadScene (SceneManager.GetActiveScene ().buildIndex);

		//加载指定场景
        yield return StartCoroutine (LoadSceneAndSetActive (sceneName));

		//加载数据
        LoadAllPersistentData ();

		//渐渐让黑色场景切换图片消失
        yield return StartCoroutine (Fade (0f));
    }


	//使用SceneManager做场景的加载和激活
    private IEnumerator LoadSceneAndSetActive (string sceneName)
    {
        yield return SceneManager.LoadSceneAsync(sceneName, LoadSceneMode.Additive);

        Scene newlyLoadedScene = SceneManager.GetSceneAt(SceneManager.sceneCount - 1);
        SceneManager.SetActiveScene(newlyLoadedScene);
    }


	//用于控制场景切换时所用的黑色图片的淡入淡出动画
    private IEnumerator Fade (float finalAlpha)
    {
		//开始切换时把raycast功能关闭
        isFading = true;
        faderCanvasGroup.blocksRaycasts = true;

		//控制图片的淡入淡出动画的速度
        float fadeSpeed = Mathf.Abs (faderCanvasGroup.alpha - finalAlpha) / fadeDuration;

		//在一定的时间内做黑色图片的淡入淡出效果
        while (!Mathf.Approximately (faderCanvasGroup.alpha, finalAlpha))
        {
			//控制黑色图片的alpha通道的值
            faderCanvasGroup.alpha = Mathf.MoveTowards (faderCanvasGroup.alpha, finalAlpha,
                fadeSpeed * Time.deltaTime);

            yield return null;
        }

		//切换完成把raycast功能打开
        isFading = false;
        faderCanvasGroup.blocksRaycasts = false;
    }


	//保存所有的ScriptableObject数据
    private void SaveAllPersistentData ()
    {
		//获取场景中所有的PersistentDataController
        PersistentDataController[] persistentDataControllers = FindObjectsOfType<PersistentDataController> ();
        for (int i = 0; i < persistentDataControllers.Length; i++)
        {
			persistentDataControllers[i].Save ();
        }
    }


	//加载所有的ScriptableObject数据
    private void LoadAllPersistentData ()
	{
		//获取场景中所有的PersistentDataController
        PersistentDataController[] persistentDataControllers = FindObjectsOfType<PersistentDataController> ();
        for (int i = 0; i < persistentDataControllers.Length; i++)
		{
			persistentDataControllers[i].Load ();
        }
    }
}
