using System.Collections;
using System.Collections.Generic;
using UnityEngine;

class XMathUtil
{
    public const float XMATH_ONE_PI = 3.141593f;
    public const float XMATH_TOW_PI = XMATH_ONE_PI * 2.0f;
    public const float XMATH_HALF_PI = XMATH_ONE_PI / 2.0f;
    public const float XMATH_QTR_PI = XMATH_ONE_PI / 4.0f;
    public const float XMATH_EIGHTH_PI = XMATH_ONE_PI / 8.0f;
    public const float XMATH_MIN_FLOAT = 0.00001f;
    public const float XMATH_MIN_FLOAT_NEG = -0.00001f;
    public const float XMATH_ONE_CIRCLE_ANGLE = 360.0f;
    public const float XMATH_HALF_CIRCLE_ANGLE = 180.0f;
    public const float XMATH_QTR_CIRCLE_ANGLE = 90.0f;
    public const float XMATH_EIGHTH_CIRCLE_ANGLE = 45.0f;
    public const float XMATH_SIN_45_DEGREE = 0.7071068f;
    public const float XMATH_SIN_40_DEGREE = 0.64278761f;
    public const float XMATH_SIN_30_DEGREE = 0.5f;


    public static bool IsEqual(float a, float b)
    {
        return Mathf.Abs(a - b) <= XMATH_MIN_FLOAT;
    }

    public static bool IsZero(float a)
    {
        if (a < XMATH_MIN_FLOAT && a > XMATH_MIN_FLOAT_NEG)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static bool IsPointInSphere(Vector3 dstPoint, Vector3 center, float radius, bool bIgnoreHeight)
    {
        Vector3 diff = dstPoint - center;
        if (bIgnoreHeight)
        {
            diff.y = 0.0f;
        }

        float diffSqrtLen = Vector3.SqrMagnitude(diff);
        if (diffSqrtLen < radius * radius)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static float _ClampAngle(float fAngle)
    {
        while (fAngle < 0.0f)
        {
            fAngle += XMathUtil.XMATH_ONE_CIRCLE_ANGLE;
        }

        while (fAngle >= XMathUtil.XMATH_ONE_CIRCLE_ANGLE)
        {
            fAngle -= XMathUtil.XMATH_ONE_CIRCLE_ANGLE;
        }

        return fAngle;
    }

    public static Vector3 _RotateVectorY(Vector3 vec, float angle)
    {
        Vector3 vNew = Vector3.zero;
        float sinAngle = Mathf.Sin(angle * Mathf.Deg2Rad);
        float cosAngle = Mathf.Cos(angle * Mathf.Deg2Rad);
        vNew.x = vec.x * cosAngle + vec.z * sinAngle;
        vNew.y = vec.y;
        vNew.z = -vec.x * sinAngle + vec.z * cosAngle;
        return vNew;
    }

    public static float Lerp(float begin, float end, float alpha)
    {
        return (1 - alpha) * begin + alpha * end;
    }

    public static Vector3 Lerp(Vector3 begin, Vector3 end, float alpha)
    {
        return (1 - alpha) * begin + alpha * end;
    }

    public static Color Lerp(Color begin, Color end, float alpha)
    {
        return (1 - alpha) * begin + alpha * end;
    }

    public static float ComputeXZDistance(Vector3 begin, Vector3 end)
    {
        Vector3 vec = end - begin;
        return (Mathf.Abs(vec.x) + Mathf.Abs(vec.z));
    }

    public static float CalcAngleYaw(Vector3 vDir)
    {
        float fAngle = -Mathf.Atan2(vDir.z, vDir.x) * Mathf.Rad2Deg;

        fAngle += XMathUtil.XMATH_QTR_CIRCLE_ANGLE;

        fAngle = ClampAngle(fAngle);

        return fAngle;
    }

    public static float CalcUIZRotate(Vector3 vDir)
    {
        float fAngle = Mathf.Atan2(vDir.y, vDir.x) * Mathf.Rad2Deg;

        fAngle -= XMathUtil.XMATH_QTR_CIRCLE_ANGLE;

        fAngle = ClampAngle(fAngle);

        return fAngle;
    }

    public static float ClampAngle(float fAngle)
    {
        while (fAngle < 0.0f)
        {
            fAngle += XMathUtil.XMATH_ONE_CIRCLE_ANGLE;
        }

        while (fAngle >= XMathUtil.XMATH_ONE_CIRCLE_ANGLE)
        {
            fAngle -= XMathUtil.XMATH_ONE_CIRCLE_ANGLE;
        }

        return fAngle;
    }

    public static Vector3 RotateAxis(Vector3 pos, Vector3 normalAxis, float fAngle)
    {
        float cosf = Mathf.Cos(fAngle);
        float sinf = Mathf.Sin(fAngle);

        float u = normalAxis.x;
        float v = normalAxis.y;
        float w = normalAxis.z;

        Vector3 rv = Vector3.zero;

        float m00 = cosf + (u * u) * (1.0f - cosf);
        float m01 = u * v * (1.0f - cosf) + w * sinf;
        float m02 = u * w * (1.0f - cosf) - v * sinf;

        float m10 = u * v * (1 - cosf) - w * sinf;
        float m11 = cosf + v * v * (1 - cosf);
        float m12 = w * v * (1.0f - cosf) + u * sinf;

        float m20 = u * w * (1.0f - cosf) + v * sinf;
        float m21 = u * w * (1.0f - cosf) - u * sinf;
        float m22 = cosf + w * w * (1.0f - cosf);

        rv.x = m00 * pos.x + m01 * pos.y + m02 * pos.z;
        rv.y = m10 * pos.x + m11 * pos.y + m12 * pos.z;
        rv.z = m20 * pos.x + m21 * pos.y + m22 * pos.z;

        return rv;
    }
}
