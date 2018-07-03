using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Unity引擎相关 常用工具函数
public class XUnityUtility
{
    public static void ChangeParent(GameObject child, GameObject parent)
    {
        if (child != null)
        {
            Transform tf = child.transform;
            if (tf != null)
            {
                Vector3 localPos = tf.localPosition;
                Vector3 localAngle = tf.localEulerAngles;
                Vector3 localScale = tf.localScale;

                if (parent != null)
                {
                    tf.SetParent(parent.transform);
                }
                else
                {
                    tf.SetParent(null);
                }
                tf.localPosition = localPos;
                tf.localEulerAngles = localAngle;
                tf.localScale = localScale;
            }
        }
    }

    public static void ChangeParentT(GameObject child, Transform parent)
    {
        if (child != null)
        {
            Transform tf = child.transform;
            if (tf != null)
            {
                Vector3 localPos = tf.localPosition;
                Vector3 localAngle = tf.localEulerAngles;
                Vector3 localScale = tf.localScale;
                tf.SetParent(parent);
                tf.localPosition = localPos;
                tf.localEulerAngles = localAngle;
                tf.localScale = localScale;
            }
        }
    }

    public static void ResetTransform(GameObject obj, bool bIncludeScale = true)
    {
        if (obj != null)
        {
            Transform tf = obj.transform;
            if (tf != null)
            {
                tf.localPosition = Vector3.zero;
                tf.localEulerAngles = Vector3.zero;
                if (bIncludeScale)
                {
                    tf.localScale = Vector3.one;
                }
            }
        }
    }

    public static GameObject AddChild(GameObject parent, GameObject prefab)
    {
        if (prefab == null)
        {
            return null;
        }

        if (parent == null)
        {
            return GameObject.Instantiate(prefab) as GameObject;
        }

        GameObject go = GameObject.Instantiate(prefab, parent.transform.position, Quaternion.identity, parent.transform) as GameObject;
        if (go != null)
        {
            Transform tNew = go.transform;
            Transform tOld = prefab.transform;
            tNew.localPosition = tOld.localPosition;
            tNew.localRotation = tOld.localRotation;
            tNew.localScale = tOld.localScale;

            go.layer = parent.layer;
        }
        return go;
    }

    public static GameObject AddChildT(Transform parent, GameObject prefab)
    {
        if (prefab == null)
        {
            return null;
        }

        if (parent == null)
        {
            return GameObject.Instantiate(prefab) as GameObject;
        }

        GameObject go = GameObject.Instantiate(prefab, parent.position, Quaternion.identity, parent) as GameObject;
        if (go != null)
        {
            Transform tNew = go.transform;
            Transform tOld = prefab.transform;
            tNew.localPosition = tOld.localPosition;
            tNew.localRotation = tOld.localRotation;
            tNew.localScale = tOld.localScale;
        }
        return go;
    }

    public static GameObject CreateChild(Transform parent, string strName)
    {
        GameObject newObject = new GameObject(strName);

        Transform tf = newObject.transform;
        tf.SetParent(parent);

        tf.localPosition = Vector3.zero;
        tf.localEulerAngles = Vector3.zero;
        tf.localScale = Vector3.one;

        return newObject;
    }


    public static void ClearChilden(GameObject target)
    {
        if (target != null)
        {
            int count = target.transform.childCount;
            Transform tf;
            for (int i = count - 1; i >= 0; i--)
            {
                tf = target.transform.GetChild(i);
                if (tf != null)
                {
                    GameObject.DestroyImmediate(tf.gameObject);
                }
            }
        }
    }

    public static void QuitGame()
    {
#if  UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
        Application.Quit();
#endif
    }

    public static void SetLayer(GameObject go, int layer)
    {
        if (go != null)
        {
            go.layer = layer;

            Transform t = go.transform;

            for (int i = 0, imax = t.childCount; i < imax; ++i)
            {
                Transform child = t.GetChild(i);
                if (child != null)
                {
                    SetLayer(child.gameObject, layer);
                }
            }
        }
    }

    public static Transform FindTransform(Transform tf, string strName)
    {
        if (tf != null)
        {
            if (string.Compare(strName, tf.name) == 0)
            {
                return tf;
            }

            Transform findTf = null;
            for (int i = 0, imax = tf.childCount; i < imax; ++i)
            {
                Transform child = tf.GetChild(i);
                if (child != null)
                {
                    findTf = FindTransform(child, strName);
                    if (findTf != null)
                    {
                        return findTf;
                    }
                }
            }
        }
        return null;
    }

    public static void SetRenderQuene(GameObject obj, int renderQueue)
    {
        if (obj != null)
        {
            Renderer[] renderList = obj.GetComponentsInChildren<Renderer>(true);
            if (renderList != null)
            {
                foreach (Renderer render in renderList)
                {
                    if (render != null)
                    {
                        foreach (Material material in render.materials)
                        {
                            if (material != null)
                            {
                                material.renderQueue = renderQueue;
                            }
                        }
                    }
                }
            }
        }
    }

    public static void ChangeRenderQuene(GameObject obj, int addRenderQueue)
    {
        if (obj != null)
        {
            Renderer[] renderList = obj.GetComponentsInChildren<Renderer>(true);
            if (renderList != null)
            {
                foreach (Renderer render in renderList)
                {
                    if (render != null)
                    {
                        foreach (Material material in render.materials)
                        {
                            if (material != null)
                            {
                                material.renderQueue += addRenderQueue;
                            }
                        }
                    }
                }
            }
        }
    }

    //设置模型的层级
    public static void SetRenderLayer(GameObject srcObject, int layer)
    {
        if (srcObject != null)
        {
            Renderer[] renderList = srcObject.GetComponentsInChildren<Renderer>(true);
            if (renderList != null)
            {
                foreach (Renderer render in renderList)
                {
                    if (render != null)
                    {
                        render.gameObject.layer = layer;
                    }
                }
            }
        }
    }

    public static Vector3 FloatListToVector3(float[] fList)
    {
        if (fList != null && fList.Length > 2)
        {
            return new Vector3(fList[0], fList[1], fList[2]);
        }
        else
        {
            return Vector3.zero;
        }
    }

    public static void _InitBundleMaterial(GameObject obj)
    {
        if (obj != null)
        {
            Renderer[] renderList = obj.GetComponentsInChildren<Renderer>(true);
            if (renderList != null)
            {
                Material mat;
                Shader sd;
                foreach (Renderer rd in renderList)
                {
                    mat = rd.sharedMaterial;
                    if (mat != null)
                    {
                        sd = Shader.Find(mat.shader.name);
                        if (sd != null)
                        {
                            mat.shader = sd;
                        }
                    }
                }
            }
        }
    }
}
