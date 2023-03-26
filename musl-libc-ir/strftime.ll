; ModuleID = 'src/time/strftime.c'
source_filename = "src/time/strftime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@.str = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"%m/%d/%y\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"%Y-%m-%d\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"%H:%M\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"%H:%M:%S\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"+%lld\00", align 1
@.str.8 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"%+.4ld\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"%*lld\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"%0*lld\00", align 1

@strftime_l = weak alias i64 (i8*, i64, i8*, %struct.tm*, %struct.__locale_struct*), i64 (i8*, i64, i8*, %struct.tm*, %struct.__locale_struct*)* @__strftime_l

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__strftime_fmt_1([100 x i8]* noundef %0, i64* nocapture noundef writeonly %1, i32 noundef %2, %struct.tm* noundef %3, %struct.__locale_struct* noundef %4, i32 noundef %5) local_unnamed_addr #0 {
  switch i32 %2, label %229 [
    i32 97, label %7
    i32 65, label %13
    i32 104, label %19
    i32 98, label %19
    i32 66, label %25
    i32 99, label %220
    i32 67, label %31
    i32 101, label %37
    i32 100, label %38
    i32 68, label %223
    i32 70, label %43
    i32 103, label %44
    i32 71, label %44
    i32 72, label %71
    i32 73, label %75
    i32 106, label %84
    i32 109, label %89
    i32 77, label %94
    i32 110, label %98
    i32 112, label %99
    i32 114, label %104
    i32 82, label %105
    i32 115, label %106
    i32 83, label %111
    i32 116, label %115
    i32 84, label %116
    i32 117, label %117
    i32 85, label %123
    i32 87, label %132
    i32 86, label %143
    i32 119, label %146
    i32 120, label %150
    i32 88, label %151
    i32 121, label %152
    i32 89, label %159
    i32 122, label %169
    i32 90, label %187
    i32 37, label %194
  ]

7:                                                ; preds = %6
  %8 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 6
  %9 = load i32, i32* %8, align 8, !tbaa !3
  %10 = icmp ugt i32 %9, 6
  br i1 %10, label %217, label %11

11:                                               ; preds = %7
  %12 = add nuw nsw i32 %9, 131072
  br label %214

13:                                               ; preds = %6
  %14 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 6
  %15 = load i32, i32* %14, align 8, !tbaa !3
  %16 = icmp ugt i32 %15, 6
  br i1 %16, label %217, label %17

17:                                               ; preds = %13
  %18 = add nuw nsw i32 %15, 131079
  br label %214

19:                                               ; preds = %6, %6
  %20 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 4
  %21 = load i32, i32* %20, align 8, !tbaa !10
  %22 = icmp ugt i32 %21, 11
  br i1 %22, label %217, label %23

23:                                               ; preds = %19
  %24 = add nuw nsw i32 %21, 131086
  br label %214

25:                                               ; preds = %6
  %26 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 4
  %27 = load i32, i32* %26, align 8, !tbaa !10
  %28 = icmp ugt i32 %27, 11
  br i1 %28, label %217, label %29

29:                                               ; preds = %25
  %30 = add nuw nsw i32 %27, 131098
  br label %214

31:                                               ; preds = %6
  %32 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 5
  %33 = load i32, i32* %32, align 4, !tbaa !11
  %34 = sext i32 %33 to i64
  %35 = add nsw i64 %34, 1900
  %36 = sdiv i64 %35, 100
  br label %195

37:                                               ; preds = %6
  br label %38

38:                                               ; preds = %6, %37
  %39 = phi i32 [ 48, %6 ], [ 95, %37 ]
  %40 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 3
  %41 = load i32, i32* %40, align 4, !tbaa !12
  %42 = sext i32 %41 to i64
  br label %195

43:                                               ; preds = %6
  br label %223

44:                                               ; preds = %6, %6
  %45 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 5
  %46 = load i32, i32* %45, align 4, !tbaa !11
  %47 = sext i32 %46 to i64
  %48 = add nsw i64 %47, 1900
  %49 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 7
  %50 = load i32, i32* %49, align 4, !tbaa !13
  %51 = icmp slt i32 %50, 3
  br i1 %51, label %52, label %55

52:                                               ; preds = %44
  %53 = tail call fastcc i32 @week_num(%struct.tm* noundef nonnull %3) #5
  %54 = add nsw i64 %47, 1899
  br label %60

55:                                               ; preds = %44
  %56 = icmp ugt i32 %50, 360
  br i1 %56, label %57, label %66

57:                                               ; preds = %55
  %58 = tail call fastcc i32 @week_num(%struct.tm* noundef nonnull %3) #5
  %59 = add nsw i64 %47, 1901
  br label %60

60:                                               ; preds = %57, %52
  %61 = phi i64 [ %54, %52 ], [ %48, %57 ]
  %62 = phi i64 [ %48, %52 ], [ %59, %57 ]
  %63 = phi i32 [ %53, %52 ], [ %58, %57 ]
  %64 = icmp eq i32 %63, 1
  %65 = select i1 %64, i64 %62, i64 %61
  br label %66

66:                                               ; preds = %60, %55
  %67 = phi i64 [ %48, %55 ], [ %65, %60 ]
  %68 = icmp eq i32 %2, 103
  br i1 %68, label %69, label %195

69:                                               ; preds = %66
  %70 = srem i64 %67, 100
  br label %195

71:                                               ; preds = %6
  %72 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 2
  %73 = load i32, i32* %72, align 8, !tbaa !14
  %74 = sext i32 %73 to i64
  br label %195

75:                                               ; preds = %6
  %76 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 2
  %77 = load i32, i32* %76, align 8, !tbaa !14
  %78 = sext i32 %77 to i64
  %79 = icmp eq i32 %77, 0
  br i1 %79, label %195, label %80

80:                                               ; preds = %75
  %81 = icmp sgt i32 %77, 12
  %82 = add nsw i64 %78, -12
  %83 = select i1 %81, i64 %82, i64 %78
  br label %195

84:                                               ; preds = %6
  %85 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 7
  %86 = load i32, i32* %85, align 4, !tbaa !13
  %87 = add nsw i32 %86, 1
  %88 = sext i32 %87 to i64
  br label %195

89:                                               ; preds = %6
  %90 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 4
  %91 = load i32, i32* %90, align 8, !tbaa !10
  %92 = add nsw i32 %91, 1
  %93 = sext i32 %92 to i64
  br label %195

94:                                               ; preds = %6
  %95 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 1
  %96 = load i32, i32* %95, align 4, !tbaa !15
  %97 = sext i32 %96 to i64
  br label %195

98:                                               ; preds = %6
  store i64 1, i64* %1, align 8, !tbaa !16
  br label %229

99:                                               ; preds = %6
  %100 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 2
  %101 = load i32, i32* %100, align 8, !tbaa !14
  %102 = icmp sgt i32 %101, 11
  %103 = select i1 %102, i32 131111, i32 131110
  br label %214

104:                                              ; preds = %6
  br label %220

105:                                              ; preds = %6
  br label %223

106:                                              ; preds = %6
  %107 = tail call i64 @__tm_to_secs(%struct.tm* noundef %3) #6
  %108 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 9
  %109 = load i64, i64* %108, align 8, !tbaa !17
  %110 = sub nsw i64 %107, %109
  br label %195

111:                                              ; preds = %6
  %112 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 0
  %113 = load i32, i32* %112, align 8, !tbaa !18
  %114 = sext i32 %113 to i64
  br label %195

115:                                              ; preds = %6
  store i64 1, i64* %1, align 8, !tbaa !16
  br label %229

116:                                              ; preds = %6
  br label %223

117:                                              ; preds = %6
  %118 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 6
  %119 = load i32, i32* %118, align 8, !tbaa !3
  %120 = icmp eq i32 %119, 0
  %121 = select i1 %120, i32 7, i32 %119
  %122 = sext i32 %121 to i64
  br label %195

123:                                              ; preds = %6
  %124 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 7
  %125 = load i32, i32* %124, align 4, !tbaa !13
  %126 = add i32 %125, 7
  %127 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 6
  %128 = load i32, i32* %127, align 8, !tbaa !3
  %129 = sub i32 %126, %128
  %130 = udiv i32 %129, 7
  %131 = zext i32 %130 to i64
  br label %195

132:                                              ; preds = %6
  %133 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 7
  %134 = load i32, i32* %133, align 4, !tbaa !13
  %135 = add i32 %134, 7
  %136 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 6
  %137 = load i32, i32* %136, align 8, !tbaa !3
  %138 = add i32 %137, 6
  %139 = urem i32 %138, 7
  %140 = sub i32 %135, %139
  %141 = udiv i32 %140, 7
  %142 = zext i32 %141 to i64
  br label %195

143:                                              ; preds = %6
  %144 = tail call fastcc i32 @week_num(%struct.tm* noundef %3) #5
  %145 = sext i32 %144 to i64
  br label %195

146:                                              ; preds = %6
  %147 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 6
  %148 = load i32, i32* %147, align 8, !tbaa !3
  %149 = sext i32 %148 to i64
  br label %195

150:                                              ; preds = %6
  br label %220

151:                                              ; preds = %6
  br label %220

152:                                              ; preds = %6
  %153 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 5
  %154 = load i32, i32* %153, align 4, !tbaa !11
  %155 = sext i32 %154 to i64
  %156 = add nsw i64 %155, 1900
  %157 = srem i64 %156, 100
  %158 = tail call i64 @llvm.abs.i64(i64 %157, i1 true)
  br label %195

159:                                              ; preds = %6
  %160 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 5
  %161 = load i32, i32* %160, align 4, !tbaa !11
  %162 = sext i32 %161 to i64
  %163 = add nsw i64 %162, 1900
  %164 = icmp sgt i32 %161, 8099
  br i1 %164, label %165, label %195

165:                                              ; preds = %159
  %166 = getelementptr inbounds [100 x i8], [100 x i8]* %0, i64 0, i64 0
  %167 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %166, i64 noundef 100, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0), i64 noundef %163) #6
  %168 = sext i32 %167 to i64
  store i64 %168, i64* %1, align 8, !tbaa !16
  br label %229

169:                                              ; preds = %6
  %170 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 8
  %171 = load i32, i32* %170, align 8, !tbaa !19
  %172 = icmp slt i32 %171, 0
  br i1 %172, label %173, label %174

173:                                              ; preds = %169
  store i64 0, i64* %1, align 8, !tbaa !16
  br label %229

174:                                              ; preds = %169
  %175 = getelementptr inbounds [100 x i8], [100 x i8]* %0, i64 0, i64 0
  %176 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 9
  %177 = load i64, i64* %176, align 8, !tbaa !17
  %178 = sdiv i64 %177, 3600
  %179 = mul nsw i64 %178, 100
  %180 = srem i64 %177, 3600
  %181 = trunc i64 %180 to i16
  %182 = sdiv i16 %181, 60
  %183 = sext i16 %182 to i64
  %184 = add nsw i64 %179, %183
  %185 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %175, i64 noundef 100, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i64 0, i64 0), i64 noundef %184) #6
  %186 = sext i32 %185 to i64
  store i64 %186, i64* %1, align 8, !tbaa !16
  br label %229

187:                                              ; preds = %6
  %188 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 8
  %189 = load i32, i32* %188, align 8, !tbaa !19
  %190 = icmp slt i32 %189, 0
  br i1 %190, label %191, label %192

191:                                              ; preds = %187
  store i64 0, i64* %1, align 8, !tbaa !16
  br label %229

192:                                              ; preds = %187
  %193 = tail call i8* @__tm_to_tzname(%struct.tm* noundef nonnull %3) #6
  br label %217

194:                                              ; preds = %6
  store i64 1, i64* %1, align 8, !tbaa !16
  br label %229

195:                                              ; preds = %152, %80, %159, %75, %66, %69, %146, %143, %132, %123, %117, %111, %106, %94, %89, %84, %71, %38, %31
  %196 = phi i64 [ %149, %146 ], [ %145, %143 ], [ %142, %132 ], [ %131, %123 ], [ %122, %117 ], [ %114, %111 ], [ %110, %106 ], [ %97, %94 ], [ %93, %89 ], [ %88, %84 ], [ %74, %71 ], [ %70, %69 ], [ %42, %38 ], [ %36, %31 ], [ %67, %66 ], [ 12, %75 ], [ %83, %80 ], [ %158, %152 ], [ %163, %159 ]
  %197 = phi i32 [ 1, %146 ], [ 2, %143 ], [ 2, %132 ], [ 2, %123 ], [ 1, %117 ], [ 2, %111 ], [ 1, %106 ], [ 2, %94 ], [ 2, %89 ], [ 3, %84 ], [ 2, %71 ], [ 2, %69 ], [ 2, %38 ], [ 2, %31 ], [ 4, %66 ], [ 2, %75 ], [ 2, %80 ], [ 2, %152 ], [ 4, %159 ]
  %198 = phi i32 [ 48, %146 ], [ 48, %143 ], [ 48, %132 ], [ 48, %123 ], [ 48, %117 ], [ 48, %111 ], [ 48, %106 ], [ 48, %94 ], [ 48, %89 ], [ 48, %84 ], [ 48, %71 ], [ 48, %69 ], [ %39, %38 ], [ 48, %31 ], [ 48, %66 ], [ 48, %75 ], [ 48, %80 ], [ 48, %152 ], [ 48, %159 ]
  %199 = icmp eq i32 %5, 0
  %200 = select i1 %199, i32 %198, i32 %5
  switch i32 %200, label %207 [
    i32 45, label %201
    i32 95, label %204
  ]

201:                                              ; preds = %195
  %202 = getelementptr inbounds [100 x i8], [100 x i8]* %0, i64 0, i64 0
  %203 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %202, i64 noundef 100, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i64 0, i64 0), i64 noundef %196) #6
  br label %210

204:                                              ; preds = %195
  %205 = getelementptr inbounds [100 x i8], [100 x i8]* %0, i64 0, i64 0
  %206 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %205, i64 noundef 100, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i64 0, i64 0), i32 noundef %197, i64 noundef %196) #6
  br label %210

207:                                              ; preds = %195
  %208 = getelementptr inbounds [100 x i8], [100 x i8]* %0, i64 0, i64 0
  %209 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %208, i64 noundef 100, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0), i32 noundef %197, i64 noundef %196) #6
  br label %210

210:                                              ; preds = %207, %204, %201
  %211 = phi i32 [ %209, %207 ], [ %206, %204 ], [ %203, %201 ]
  %212 = sext i32 %211 to i64
  store i64 %212, i64* %1, align 8, !tbaa !16
  %213 = getelementptr inbounds [100 x i8], [100 x i8]* %0, i64 0, i64 0
  br label %229

214:                                              ; preds = %99, %29, %23, %17, %11
  %215 = phi i32 [ %103, %99 ], [ %30, %29 ], [ %24, %23 ], [ %18, %17 ], [ %12, %11 ]
  %216 = tail call i8* @__nl_langinfo_l(i32 noundef %215, %struct.__locale_struct* noundef %4) #6
  br label %217

217:                                              ; preds = %25, %19, %13, %7, %214, %192
  %218 = phi i8* [ %193, %192 ], [ %216, %214 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %25 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %19 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %13 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), %7 ]
  %219 = tail call i64 @strlen(i8* noundef %218) #6
  store i64 %219, i64* %1, align 8, !tbaa !16
  br label %229

220:                                              ; preds = %6, %151, %150, %104
  %221 = phi i32 [ 131114, %151 ], [ 131113, %150 ], [ 131115, %104 ], [ 131112, %6 ]
  %222 = tail call i8* @__nl_langinfo_l(i32 noundef %221, %struct.__locale_struct* noundef %4) #6
  br label %223

223:                                              ; preds = %6, %220, %116, %105, %43
  %224 = phi i8* [ %222, %220 ], [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0), %116 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), %105 ], [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), %43 ], [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), %6 ]
  %225 = getelementptr inbounds [100 x i8], [100 x i8]* %0, i64 0, i64 0
  %226 = tail call i64 @__strftime_l(i8* noundef %225, i64 noundef 100, i8* noundef %224, %struct.tm* noundef %3, %struct.__locale_struct* noundef %4) #5
  store i64 %226, i64* %1, align 8, !tbaa !16
  %227 = icmp eq i64 %226, 0
  %228 = select i1 %227, i8* null, i8* %225
  br label %229

229:                                              ; preds = %223, %6, %217, %210, %194, %191, %174, %173, %165, %115, %98
  %230 = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i64 0, i64 0), %194 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.8, i64 0, i64 0), %191 ], [ %218, %217 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.8, i64 0, i64 0), %173 ], [ %175, %174 ], [ %166, %165 ], [ %213, %210 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0), %115 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0), %98 ], [ null, %6 ], [ %228, %223 ]
  ret i8* %230
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define internal fastcc i32 @week_num(%struct.tm* nocapture noundef readonly %0) unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 7
  %3 = load i32, i32* %2, align 4, !tbaa !13
  %4 = add i32 %3, 7
  %5 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 6
  %6 = load i32, i32* %5, align 8, !tbaa !3
  %7 = add i32 %6, 6
  %8 = urem i32 %7, 7
  %9 = sub i32 %4, %8
  %10 = udiv i32 %9, 7
  %11 = sub i32 371, %3
  %12 = add i32 %11, %6
  %13 = add i32 %12, -2
  %14 = urem i32 %13, 7
  %15 = icmp ult i32 %14, 3
  %16 = zext i1 %15 to i32
  %17 = add nuw nsw i32 %10, %16
  switch i32 %17, label %56 [
    i32 0, label %18
    i32 53, label %38
  ]

18:                                               ; preds = %1
  %19 = sub i32 6, %3
  %20 = add i32 %19, %6
  %21 = urem i32 %20, 7
  switch i32 %21, label %56 [
    i32 4, label %37
    i32 5, label %22
  ]

22:                                               ; preds = %18
  %23 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 5
  %24 = load i32, i32* %23, align 4, !tbaa !11
  %25 = srem i32 %24, 400
  %26 = add nsw i32 %25, 3
  %27 = and i32 %26, 3
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %56

29:                                               ; preds = %22
  %30 = trunc i32 %25 to i16
  %31 = add nsw i16 %30, 1899
  %32 = urem i16 %31, 100
  %33 = icmp ne i16 %32, 0
  %34 = urem i16 %31, 400
  %35 = icmp eq i16 %34, 0
  %36 = or i1 %33, %35
  br i1 %36, label %37, label %56

37:                                               ; preds = %29, %18
  br label %56

38:                                               ; preds = %1
  %39 = urem i32 %12, 7
  switch i32 %39, label %55 [
    i32 4, label %56
    i32 3, label %40
  ]

40:                                               ; preds = %38
  %41 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 5
  %42 = load i32, i32* %41, align 4, !tbaa !11
  %43 = icmp sgt i32 %42, 2147481747
  %44 = add nsw i32 %42, -2000
  %45 = select i1 %43, i32 %44, i32 %42
  %46 = add nsw i32 %45, 1900
  %47 = and i32 %45, 3
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %55

49:                                               ; preds = %40
  %50 = srem i32 %46, 100
  %51 = icmp ne i32 %50, 0
  %52 = srem i32 %46, 400
  %53 = icmp eq i32 %52, 0
  %54 = or i1 %51, %53
  br i1 %54, label %56, label %55

55:                                               ; preds = %49, %40, %38
  br label %56

56:                                               ; preds = %29, %49, %22, %55, %38, %1, %37, %18
  %57 = phi i32 [ 53, %37 ], [ 52, %18 ], [ %17, %1 ], [ 1, %55 ], [ 53, %38 ], [ 52, %22 ], [ 53, %49 ], [ 52, %29 ]
  ret i32 %57
}

; Function Attrs: optsize
declare hidden i64 @__tm_to_secs(%struct.tm* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i8* @__tm_to_tzname(%struct.tm* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @__nl_langinfo_l(i32 noundef, %struct.__locale_struct* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__strftime_l(i8* noalias noundef %0, i64 noundef %1, i8* noalias noundef %2, %struct.tm* noalias noundef %3, %struct.__locale_struct* noundef %4) #0 {
  %6 = alloca i64, align 8
  %7 = alloca [100 x i8], align 16
  %8 = alloca i8*, align 8
  %9 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #7
  %10 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %10) #7
  %11 = bitcast i8** %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %11) #7
  %12 = icmp eq i64 %1, 0
  br i1 %12, label %155, label %13

13:                                               ; preds = %5
  %14 = getelementptr inbounds %struct.tm, %struct.tm* %3, i64 0, i32 5
  br label %15

15:                                               ; preds = %13, %140
  %16 = phi i64 [ 0, %13 ], [ %142, %140 ]
  %17 = phi i8* [ %2, %13 ], [ %143, %140 ]
  %18 = load i8, i8* %17, align 1, !tbaa !20
  switch i8 %18, label %19 [
    i8 0, label %151
    i8 37, label %22
  ]

19:                                               ; preds = %15
  %20 = add nuw i64 %16, 1
  %21 = getelementptr inbounds i8, i8* %0, i64 %16
  store i8 %18, i8* %21, align 1, !tbaa !20
  br label %140

22:                                               ; preds = %15
  %23 = getelementptr inbounds i8, i8* %17, i64 1
  %24 = load i8, i8* %23, align 1, !tbaa !20
  switch i8 %24, label %29 [
    i8 45, label %25
    i8 95, label %25
    i8 48, label %25
  ]

25:                                               ; preds = %22, %22, %22
  %26 = getelementptr inbounds i8, i8* %17, i64 2
  %27 = zext i8 %24 to i32
  %28 = load i8, i8* %26, align 1, !tbaa !20
  br label %29

29:                                               ; preds = %22, %25
  %30 = phi i8 [ %24, %22 ], [ %28, %25 ]
  %31 = phi i64 [ 1, %22 ], [ 2, %25 ]
  %32 = phi i32 [ 0, %22 ], [ %27, %25 ]
  %33 = getelementptr inbounds i8, i8* %17, i64 %31
  %34 = icmp eq i8 %30, 43
  %35 = zext i1 %34 to i64
  %36 = getelementptr i8, i8* %33, i64 %35
  %37 = call i64 @strtoul(i8* noundef nonnull %36, i8** noundef nonnull %8, i32 noundef 10) #6
  %38 = load i8*, i8** %8, align 8, !tbaa !21
  %39 = load i8, i8* %38, align 1, !tbaa !20
  switch i8 %39, label %45 [
    i8 67, label %40
    i8 70, label %40
    i8 71, label %40
    i8 89, label %40
  ]

40:                                               ; preds = %29, %29, %29, %29
  %41 = icmp eq i64 %37, 0
  br i1 %41, label %42, label %45

42:                                               ; preds = %40
  %43 = icmp ne i8* %38, %36
  %44 = zext i1 %43 to i64
  br label %45

45:                                               ; preds = %42, %29, %40
  %46 = phi i64 [ %37, %40 ], [ %44, %42 ], [ 0, %29 ]
  switch i8 %39, label %50 [
    i8 69, label %47
    i8 79, label %47
  ]

47:                                               ; preds = %45, %45
  %48 = getelementptr inbounds i8, i8* %38, i64 1
  %49 = load i8, i8* %48, align 1, !tbaa !20
  br label %50

50:                                               ; preds = %45, %47
  %51 = phi i8 [ %49, %47 ], [ %39, %45 ]
  %52 = phi i8* [ %48, %47 ], [ %38, %45 ]
  %53 = sext i8 %51 to i32
  %54 = call i8* @__strftime_fmt_1([100 x i8]* noundef nonnull %7, i64* noundef nonnull %6, i32 noundef %53, %struct.tm* noundef %3, %struct.__locale_struct* noundef %4, i32 noundef %32) #5
  %55 = icmp eq i8* %54, null
  br i1 %55, label %146, label %56

56:                                               ; preds = %50
  %57 = icmp eq i64 %46, 0
  br i1 %57, label %58, label %60

58:                                               ; preds = %56
  %59 = load i64, i64* %6, align 8, !tbaa !16
  br label %130

60:                                               ; preds = %56
  %61 = load i8, i8* %54, align 1, !tbaa !20
  switch i8 %61, label %62 [
    i8 43, label %64
    i8 45, label %64
  ]

62:                                               ; preds = %60
  %63 = load i64, i64* %6, align 8, !tbaa !16
  br label %69

64:                                               ; preds = %60, %60
  %65 = getelementptr inbounds i8, i8* %54, i64 1
  %66 = load i64, i64* %6, align 8, !tbaa !16
  %67 = add i64 %66, -1
  %68 = load i8, i8* %65, align 1, !tbaa !20
  br label %69

69:                                               ; preds = %62, %64
  %70 = phi i8 [ %68, %64 ], [ %61, %62 ]
  %71 = phi i64 [ %67, %64 ], [ %63, %62 ]
  %72 = phi i8* [ %65, %64 ], [ %54, %62 ]
  %73 = icmp eq i8 %70, 48
  br i1 %73, label %74, label %85

74:                                               ; preds = %69, %82
  %75 = phi i8* [ %77, %82 ], [ %72, %69 ]
  %76 = phi i64 [ %83, %82 ], [ %71, %69 ]
  %77 = getelementptr inbounds i8, i8* %75, i64 1
  %78 = load i8, i8* %77, align 1, !tbaa !20
  %79 = sext i8 %78 to i32
  %80 = add nsw i32 %79, -48
  %81 = icmp ult i32 %80, 10
  br i1 %81, label %82, label %85

82:                                               ; preds = %74
  %83 = add i64 %76, -1
  %84 = icmp eq i8 %78, 48
  br i1 %84, label %74, label %85

85:                                               ; preds = %74, %82, %69
  %86 = phi i64 [ %71, %69 ], [ %83, %82 ], [ %76, %74 ]
  %87 = phi i8* [ %72, %69 ], [ %77, %82 ], [ %75, %74 ]
  store i64 %86, i64* %6, align 8, !tbaa !16
  %88 = icmp ult i64 %46, %86
  br label %89

89:                                               ; preds = %89, %85
  %90 = phi i64 [ 0, %85 ], [ %96, %89 ]
  %91 = getelementptr inbounds i8, i8* %87, i64 %90
  %92 = load i8, i8* %91, align 1, !tbaa !20
  %93 = sext i8 %92 to i32
  %94 = add nsw i32 %93, -48
  %95 = icmp ult i32 %94, 10
  %96 = add i64 %90, 1
  br i1 %95, label %89, label %97

97:                                               ; preds = %89
  %98 = select i1 %88, i64 %86, i64 %46
  %99 = load i32, i32* %14, align 4, !tbaa !11
  %100 = icmp slt i32 %99, -1900
  br i1 %100, label %110, label %101

101:                                              ; preds = %97
  br i1 %34, label %102, label %115

102:                                              ; preds = %101
  %103 = sub i64 %98, %86
  %104 = add i64 %103, %90
  %105 = load i8*, i8** %8, align 8, !tbaa !21
  %106 = load i8, i8* %105, align 1, !tbaa !20
  %107 = icmp eq i8 %106, 67
  %108 = select i1 %107, i64 3, i64 5
  %109 = icmp ult i64 %104, %108
  br i1 %109, label %115, label %110

110:                                              ; preds = %102, %97
  %111 = phi i8 [ 45, %97 ], [ 43, %102 ]
  %112 = add i64 %16, 1
  %113 = getelementptr inbounds i8, i8* %0, i64 %16
  store i8 %111, i8* %113, align 1, !tbaa !20
  %114 = add i64 %98, -1
  br label %115

115:                                              ; preds = %110, %101, %102
  %116 = phi i64 [ %16, %102 ], [ %16, %101 ], [ %112, %110 ]
  %117 = phi i64 [ %98, %102 ], [ %98, %101 ], [ %114, %110 ]
  %118 = icmp ugt i64 %117, %86
  %119 = icmp ult i64 %116, %1
  %120 = select i1 %118, i1 %119, i1 false
  br i1 %120, label %121, label %130

121:                                              ; preds = %115, %121
  %122 = phi i64 [ %126, %121 ], [ %117, %115 ]
  %123 = phi i64 [ %124, %121 ], [ %116, %115 ]
  %124 = add nuw i64 %123, 1
  %125 = getelementptr inbounds i8, i8* %0, i64 %123
  store i8 48, i8* %125, align 1, !tbaa !20
  %126 = add i64 %122, -1
  %127 = icmp ugt i64 %126, %86
  %128 = icmp ult i64 %124, %1
  %129 = select i1 %127, i1 %128, i1 false
  br i1 %129, label %121, label %130

130:                                              ; preds = %121, %58, %115
  %131 = phi i64 [ %59, %58 ], [ %86, %115 ], [ %86, %121 ]
  %132 = phi i64 [ %16, %58 ], [ %116, %115 ], [ %124, %121 ]
  %133 = phi i8* [ %54, %58 ], [ %87, %115 ], [ %87, %121 ]
  %134 = sub i64 %1, %132
  %135 = icmp ugt i64 %131, %134
  %136 = select i1 %135, i64 %134, i64 %131
  store i64 %136, i64* %6, align 8
  %137 = getelementptr inbounds i8, i8* %0, i64 %132
  %138 = call i8* @memcpy(i8* noundef %137, i8* noundef nonnull %133, i64 noundef %136) #6
  %139 = add i64 %136, %132
  br label %140

140:                                              ; preds = %130, %19
  %141 = phi i8* [ %17, %19 ], [ %52, %130 ]
  %142 = phi i64 [ %20, %19 ], [ %139, %130 ]
  %143 = getelementptr inbounds i8, i8* %141, i64 1
  %144 = icmp ult i64 %142, %1
  br i1 %144, label %15, label %145

145:                                              ; preds = %140
  br i1 %12, label %155, label %146

146:                                              ; preds = %50, %145
  %147 = phi i64 [ %142, %145 ], [ %16, %50 ]
  %148 = icmp eq i64 %147, %1
  %149 = add i64 %1, -1
  %150 = select i1 %148, i64 %149, i64 %147
  br label %151

151:                                              ; preds = %15, %146
  %152 = phi i64 [ %150, %146 ], [ %16, %15 ]
  %153 = phi i64 [ 0, %146 ], [ %16, %15 ]
  %154 = getelementptr inbounds i8, i8* %0, i64 %152
  store i8 0, i8* %154, align 1, !tbaa !20
  br label %155

155:                                              ; preds = %151, %5, %145
  %156 = phi i64 [ 0, %145 ], [ 0, %5 ], [ %153, %151 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #7
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %10) #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #7
  ret i64 %156
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nounwind optsize strictfp
define i64 @strftime(i8* noalias noundef %0, i64 noundef %1, i8* noalias noundef %2, %struct.tm* noalias noundef %3) local_unnamed_addr #0 {
  %5 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !22
  %6 = inttoptr i64 %5 to %struct.__pthread*
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 24
  %8 = load %struct.__locale_struct*, %struct.__locale_struct** %7, align 8, !tbaa !23
  %9 = tail call i64 @__strftime_l(i8* noundef %0, i64 noundef %1, i8* noundef %2, %struct.tm* noundef %3, %struct.__locale_struct* noundef %8) #5
  ret i64 %9
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.abs.i64(i64, i1 immarg) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nounwind strictfp }
attributes #8 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 24}
!4 = !{!"tm", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16, !5, i64 20, !5, i64 24, !5, i64 28, !5, i64 32, !8, i64 40, !9, i64 48}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"any pointer", !6, i64 0}
!10 = !{!4, !5, i64 16}
!11 = !{!4, !5, i64 20}
!12 = !{!4, !5, i64 12}
!13 = !{!4, !5, i64 28}
!14 = !{!4, !5, i64 8}
!15 = !{!4, !5, i64 4}
!16 = !{!8, !8, i64 0}
!17 = !{!4, !8, i64 40}
!18 = !{!4, !5, i64 0}
!19 = !{!4, !5, i64 32}
!20 = !{!6, !6, i64 0}
!21 = !{!9, !9, i64 0}
!22 = !{i64 283392}
!23 = !{!24, !9, i64 168}
!24 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !8, i64 32, !8, i64 40, !5, i64 48, !5, i64 52, !5, i64 56, !5, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !9, i64 72, !8, i64 80, !9, i64 88, !8, i64 96, !8, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !25, i64 136, !5, i64 160, !5, i64 164, !9, i64 168, !6, i64 176, !9, i64 184, !9, i64 192}
!25 = !{!"", !9, i64 0, !8, i64 8, !9, i64 16}
